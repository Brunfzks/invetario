// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:inventario_site/src/modules/dashboard/widget/carrosel_salas/carrosel_salas_card_controller.dart';
import 'package:inventario_site/src/modules/dashboard/widget/custom_painter_circular/custom_painter_circular.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';

class CarroselSalaCard extends StatelessWidget {
  CarroselSalaCard({Key? key, required, required this.controller})
      : super(key: key);

  CarroselSalaCardController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 200,
        height: 130,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primaryLight),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: CustomPaint(
                  painter: CircularCustomPainter(),
                  child: Container(),
                ),
              ),
            ),
            Text(
              controller.local.dsLocal,
              style: AppText.labelText,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
