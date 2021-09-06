import 'package:flutter/material.dart';
import 'package:inventario_site/src/modules/home/widget/side_menu_test/widget/clipper.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_theme.dart';

class SideMenuTeste extends StatelessWidget {
  const SideMenuTeste({
    Key? key,
    this.onTap1,
    this.onTap2,
    this.onTap3,
  }) : super(key: key);

  final VoidCallback? onTap1;
  final VoidCallback? onTap2;
  final VoidCallback? onTap3;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomClipperImage(),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
