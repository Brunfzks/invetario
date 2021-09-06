import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/home/home_controller.dart';
import 'package:inventario_site/src/modules/home/widget/side_menu_test/widget/card_side_menu.dart';
import 'package:inventario_site/src/modules/home/widget/side_menu_test/widget/clipper.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_theme.dart';

class SideMenuTeste extends StatelessWidget {
  SideMenuTeste({
    Key? key,
    this.onTap1,
    this.onTap2,
    this.onTap3,
  }) : super(key: key);

  final VoidCallback? onTap1;
  final VoidCallback? onTap2;
  final VoidCallback? onTap3;
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          color: AppColors.primary,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(),
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 8.0,
                      left: 20.0,
                    ),
                    child: Container(
                      child: CardSideMenu(
                        onTap: onTap1,
                        indexMenu: 0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 8.0,
                      left: 20.0,
                    ),
                    child: Container(
                      child: CardSideMenu(
                        onTap: onTap2,
                        indexMenu: 1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
