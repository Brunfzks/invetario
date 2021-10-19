import 'package:flutter/material.dart';
import 'package:inventario_site/src/modules/dashboard/widget/carrosel_salas/carrosel_salas_card_controller.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';

class CarroselSalaCard extends StatelessWidget {
  CarroselSalaCard({Key? key, required, required this.controller}) : super(key: key);

  CarroselSalaCardController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 130,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(controller.local.dsLocal,style: AppText.labelText,)
        ],
      ),
    );
  }
}
