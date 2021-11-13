import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/home/home_controller.dart';
import 'package:inventario_site/src/modules/home/widget/side_menu/widget/card_side_menu/card_side_menu.dart';
import 'package:inventario_site/src/modules/home/widget/side_menu/widget/card_usuario_side/card_usuario_side.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_theme.dart';

class SideMenu extends StatelessWidget {
  SideMenu({
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
              child: CardUsuarioSide(),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: AppColors.primaryLight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5.0,
                        left: 20.0,
                      ),
                      child: CardSideMenu(
                        textLabel: 'Dashboard',
                        icon: Icons.window,
                        onTap: onTap1,
                        indexMenu: 0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5.0,
                        left: 20.0,
                      ),
                      child: CardSideMenu(
                        icon: Icons.app_registration,
                        textLabel: 'Cadastros',
                        onTap: onTap2,
                        indexMenu: 1,
                      ),
                      
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5.0,
                        left: 20.0,
                      ),
                      child: CardSideMenu(
                        icon: Icons.find_in_page,
                        textLabel: 'Relatorios',
                        onTap: onTap3,
                        indexMenu: 2,
                      ),
                      
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
