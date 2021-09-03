import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/home/widget/side_menu.dart';
import 'package:shared/shared.dart';

import 'home_controller.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  HomeController homeController = Get.find();

  final pages = [
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          children: [
            Container(
              child: SideMenu(
                onTap1: () {
                  homeController.currentPage.value = 0;
                },
                onTap2: () {
                  homeController.currentPage.value = 1;
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
