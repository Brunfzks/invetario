// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    controller.getPercentual();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
          padding: const EdgeInsets.all(10),
          width: 200,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryLight),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: CustomPaint(
                    painter: CircularCustomPainter(porcentagem: controller.percentualConcluido.value),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 5),
                        child: Text(
                          '${controller.percentualConcluido.value.toInt()}%',style: AppText.labelText,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      controller.local.dsLocal,
                      style: AppText.labelText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
