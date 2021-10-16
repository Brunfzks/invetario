import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:inventario_app/src/modules/home/home_controller.dart';
import 'package:inventario_app/src/modules/home/locais/widgets/card_local.dart';
import 'package:shared/constantes/app_text.dart';

import 'locais_controller.dart';

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
  int _selectedIndex = 9999;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('SEUS LOCAIS',
              textAlign: TextAlign.left, style: AppText.textTitlePage),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => Expanded(
              child: ListView.builder(
                key: Key('selected $_selectedIndex'),
                itemCount: homeController.locais.length,
                itemBuilder: (BuildContext context, int index) {
                  final int count = homeController.locais.length > 10
                      ? 10
                      : homeController.locais.length;

                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));

                  animationController.forward();
                  final LocalController localController =
                      Get.put(LocalController());

                  return CardLocal(
                    initialExpanded: index == _selectedIndex,
                    keyNumber: index,
                    localController: localController,
                    onExpansionChanged: (e) {
                      if (e) {
                        localController.loading.value = true;

                        localController.getPatrimonios(
                            Id_local: homeController.locais[index].idLocal!);
                        setState(() {
                          _selectedIndex = index;
                        });
                      }
                    },
                    scaffoldKey: homeController.scaffoldKey,
                    modelLocal: homeController.locais[index],
                    animation: animation,
                    animationController: animationController,
                  );
                },
              ),
            ),
          )
        ]));
  }
}
