// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/home/home_controller.dart';
import 'package:shared/shared.dart';

class CardRelatorioIdentificacaoLocal extends StatelessWidget {
  CardRelatorioIdentificacaoLocal({Key? key, required this.modelLocal}) : super(key: key);

  ModelLocal modelLocal;
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
              modelLocal.idLocal.toString(),
            ),
            Text(
              modelLocal.dsLocal,
            ),
            Text(
                  homeController.listUsuario
                      .firstWhere(
                          (usuario) => usuario.idUsuario == modelLocal.idUsuario)
                      .nmUsuario
                      .toString(),
                ),
          ],
        ),
      ),
    );
  }
}
