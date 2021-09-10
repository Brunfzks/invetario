import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/home/widget/side_menu/side_menu.dart';
import 'home_controller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  HomeController homeController = Get.find();

  final pages = [
    Container(
      color: Colors.white,
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          children: [
            Container(
              width: deviceInfo.size.width * 0.2,
              child: SideMenu(
                onTap1: () {
                  homeController.currentPage.value = 0;
                  homeController.oofSetBottomMenu.value = 395;
                  homeController.oofSetTopMenu.value = 240;
                },
                onTap2: () {
                  homeController.currentPage.value = 1;
                  homeController.oofSetBottomMenu.value = 340;
                  homeController.oofSetTopMenu.value = 285;
                },
              ),
            ),
            Obx(
              () => Container(
                child: Expanded(
                  child: pages[homeController.currentPage.value],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
