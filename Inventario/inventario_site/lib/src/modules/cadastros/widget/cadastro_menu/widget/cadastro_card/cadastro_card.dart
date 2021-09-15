import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/cadastros/cadastro_controller.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_theme.dart';

class CadastroCard extends StatelessWidget {
  CadastroCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.indexMenu,
  }) : super(key: key);

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final CadastroController cadastroController = Get.find();
  final int indexMenu;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: AppColors.primary,
        onTap: onTap,
        child: Obx(
          () => Container(
            height: 60,
            decoration: BoxDecoration(
                color: cadastroController.currentPage.value != indexMenu
                    ? AppColors.secondary
                    : AppColors.primary,
                border: Border.all(width: 1, color: AppColors.primary),
                borderRadius: indexMenu == 0
                    ? const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      )
                    : indexMenu == 2
                        ? const BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          )
                        : null),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: cadastroController.currentPage.value != indexMenu
                      ? AppColors.primary
                      : AppColors.secondary,
                ),
                Text(
                  label,
                  style: cadastroController.currentPage.value != indexMenu
                      ? AppTheme.headlinePrimary
                      : AppTheme.headlineSecondary,
                ),
              ],
            ),
          ),
        ));
  }
}
