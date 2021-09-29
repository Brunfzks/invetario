import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:inventario_app/src/modules/home/home_controller.dart';
import 'package:inventario_app/src/modules/home/locais/widgets/card_local.dart';
import 'package:shared/constantes/app_text.dart';

class Locais extends StatefulWidget {
  Locais({
    Key? key,
  }) : super(key: key);

  @override
  State<Locais> createState() => _LocaisState();
}

class _LocaisState extends State<Locais> with TickerProviderStateMixin {
  late final AnimationController animationController;

  final HomeController homeController = Get.find();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        height: 50,
      ),
      Text('Seus Locais',
          textAlign: TextAlign.left, style: AppText.textTitlePage),
      const SizedBox(
        height: 20,
      ),
      Obx(
        () => ListView.builder(
          shrinkWrap: true,
          itemCount: homeController.locais.length,
          itemBuilder: (BuildContext context, int index) {
            final int count = homeController.locais.length > 10
                ? 10
                : homeController.locais.length;

            final Animation<double> animation =
                Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                    parent: animationController,
                    curve: Interval((1 / count) * index, 1.0,
                        curve: Curves.fastOutSlowIn)));

            animationController.forward();

            return CardLocal(
              scaffoldKey: homeController.scaffoldKey,
              modelLocal: homeController.locais[index],
              animation: animation,
              animationController: animationController,
            );
          },
        ),
      )
    ]);
  }
}
