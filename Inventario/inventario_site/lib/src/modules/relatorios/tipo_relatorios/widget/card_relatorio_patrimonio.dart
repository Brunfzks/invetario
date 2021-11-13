// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/home/home_controller.dart';
import 'package:shared/shared.dart';

class CardRelatorioNaoEncontrado extends StatelessWidget {
  CardRelatorioNaoEncontrado({Key? key, required this.modelPatrimonio}) : super(key: key);

  ModelPatrimonio modelPatrimonio;
  HomeController homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(border: Border.all()),
        child: Column(
          children: [
            Text(
              modelPatrimonio.nmPatrimonio.toString(),
            ),
            Text(
              modelPatrimonio.dsPatrimonio,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  homeController.listLocal
                      .firstWhere(
                          (local) => local.idLocal == modelPatrimonio.idLocal)
                      .dsLocal
                      .toString(),
                ),
                Text(
                  modelPatrimonio.vlPatrimonio.toString()
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
