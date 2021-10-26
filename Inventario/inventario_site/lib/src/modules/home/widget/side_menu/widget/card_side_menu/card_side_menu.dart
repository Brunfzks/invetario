import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/home/home_controller.dart';
import 'package:inventario_site/src/modules/home/widget/side_menu/widget/card_side_menu/clipper.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';
import 'package:shared/constantes/app_theme.dart';

class CardSideMenu extends StatelessWidget {
  CardSideMenu({
    Key? key,
    this.onTap,
    required this.indexMenu,
    required this.textLabel,
    required this.icon,
  }) : super(key: key);
  final VoidCallback? onTap;
  final HomeController homeController = Get.find();
  final int indexMenu;
  final String textLabel;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      width: 300,
      child: ClipPath(
          clipper: CustomClipperImage(),
          child: Obx(
            () => InkWell(
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: onTap,
              child: Container(
                color: homeController.currentPage.value == indexMenu
                    ? Colors.white
                    : Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: homeController.currentPage.value == indexMenu
                            ? Icon(
                                icon,
                                color: AppColors.primary,
                              )
                            : Icon(icon, color: AppColors.secondary),
                      ),
                      Text(
                        textLabel,
                        style: homeController.currentPage.value == indexMenu
                            ? AppText.labelSelected
                            : AppText.labelTextWhite,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
