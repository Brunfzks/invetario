import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_app/src/modules/home/home_controller.dart';
import 'package:inventario_app/src/modules/home/notificacoes/widget/card_notificacao.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';

class Notificacoes extends StatefulWidget {
  Notificacoes({
    Key? key,
  }) : super(key: key);

  @override
  State<Notificacoes> createState() => _NotificacoesState();
}

class _NotificacoesState extends State<Notificacoes>
    with TickerProviderStateMixin {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Notificações'.toUpperCase(),
                    textAlign: TextAlign.left, style: AppText.textTitlePage),
                Obx(() => InkWell(
                      onTap: () {
                        homeController.showHideNotifications();
                      },
                      child: Icon(
                        homeController.showNotifications.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.textColor,
                      ),
                    )),
              ],
            )),
        const SizedBox(
          height: 20,
        ),
        Obx(() => homeController.showNotifications.value
            ? SizedBox(
                height: 200,
                child: ListView.builder(
                  padding: const EdgeInsets.only(
                    right: 20,
                  ),
                  itemCount: homeController.notificacao.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final int count = homeController.notificacao.length > 10
                        ? 10
                        : homeController.notificacao.length;

                    final Animation<double> animation =
                        Tween<double>(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                                parent: animationController,
                                curve: Interval((1 / count) * index, 1.0,
                                    curve: Curves.fastOutSlowIn)));

                    animationController.forward();
                    homeController.notificacao[index].idUsuario =
                        homeController.usuario.idUsuario!;
                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: CardNotificacao(
                        scaffoldKey: homeController.scaffoldKey,
                        modelNotificacao: homeController.notificacao[index],
                        animation: animation,
                        animationController: animationController,
                      ),
                    );
                  },
                ))
            : Container()),
      ],
    );
  }
}
