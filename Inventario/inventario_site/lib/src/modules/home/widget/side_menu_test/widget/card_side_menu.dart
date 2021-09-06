import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/home/home_controller.dart';
import 'package:inventario_site/src/modules/home/widget/side_menu_test/widget/clipper.dart';
import 'package:shared/constantes/app_text.dart';
import 'package:shared/constantes/app_theme.dart';

class CardSideMenu extends StatelessWidget {
  CardSideMenu({
    Key? key,
    this.onTap,
    required this.indexMenu,
  }) : super(key: key);
  final VoidCallback? onTap;
  final HomeController homeController = Get.find();
  final int indexMenu;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 300,
      child: ClipPath(
          clipper: CustomClipperImage(),
          child: Obx(
            () => InkWell(
              onTap: onTap,
              child: Container(
                color: homeController.currentPage.value == indexMenu
                    ? Colors.white
                    : Colors.transparent,
                child: Row(children: [
                  Text(
                    'TESTE',
                    style: AppText.title,
                  ),
                ]),
              ),
            ),
          )),
    );
  }
}
