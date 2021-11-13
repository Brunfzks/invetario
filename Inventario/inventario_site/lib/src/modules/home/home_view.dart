// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/shared/widgets/alert/alert.dart';
import 'package:inventario_site/src/modules/cadastros/cadastro_view.dart';
import 'package:inventario_site/src/modules/dashboard/dashboard_view.dart';
import 'package:inventario_site/src/modules/home/widget/side_menu/side_menu.dart';
import 'package:inventario_site/src/modules/local/local_controller.dart';
import 'package:inventario_site/src/modules/patrimonio/patrimonio_controller.dart';
import 'package:inventario_site/src/modules/relatorios/relatorio_controller.dart';
import 'package:inventario_site/src/modules/relatorios/relatorio_view.dart';
import 'package:inventario_site/src/modules/usuario/usuario_controller.dart';
import 'home_controller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  HomeController homeController = Get.find();
  UsuarioController usuarioController = Get.put(UsuarioController());
  LocalController localController = Get.put(LocalController());
  PatrimonioController patrimonioController = Get.put(PatrimonioController());
  RelatorioController relatorioController = Get.put(RelatorioController());

  final pages = [
    DashboardPage(),
    CadastroPage(),
    RelatorioView(),
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          children: [
            SizedBox(
              width: deviceInfo.size.width * 0.2,
              child: SideMenu(
                onTap1: () {
                  homeController.currentPage.value = 0;
                },
                onTap2: () {
                  homeController.currentPage.value = 1;
                },
                onTap3: () {
                  homeController.currentPage.value = 2;
                },
              ),
            ),
            Obx(
              () => Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    pages[homeController.currentPage.value],
                    AnimatedPositioned(
                      duration: const Duration(seconds: 1),
                      bottom: homeController.isShowAlert.value ? 60 : -60,
                      curve: Curves.fastOutSlowIn,
                      child: Alert(
                        color: homeController.colorAlert.value!,
                        icon: homeController.iconAlert.value,
                        text: homeController.textAlert.value,
                        onTap: () {
                          homeController.isShowAlert.value = false;
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
