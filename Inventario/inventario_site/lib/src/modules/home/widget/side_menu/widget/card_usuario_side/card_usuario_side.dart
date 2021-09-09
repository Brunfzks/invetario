import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/home/home_controller.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';
import 'package:shared/constantes/app_theme.dart';

class CardUsuarioSide extends StatelessWidget {
  CardUsuarioSide({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: AppColors.secondary,
            image: DecorationImage(
                image: Image.asset(
              'assets/logoif.png',
            ).image),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Bem Vindo, ${homeController.usuario.nmUsuario}',
          style: AppTheme.captionLightBig,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          homeController.usuario.ptUsuario,
          style: AppTheme.captionLight,
        ),
      ],
    );
  }
}
