// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/relatorios/relatorio_controller.dart';
import 'package:inventario_site/src/modules/relatorios/tipo_relatorios/nao_localizados.dart';
import 'package:inventario_site/src/modules/relatorios/tipo_relatorios/relatorio_identificacao_local.dart';
import 'package:inventario_site/src/modules/relatorios/tipo_relatorios/relatorio_inseriveis.dart';
import 'package:inventario_site/src/modules/relatorios/tipo_relatorios/relatorio_ociosos.dart';
import 'package:inventario_site/src/modules/relatorios/widget/relatorio_menu_widget.dart';

class RelatorioView extends StatelessWidget {
  RelatorioView({Key? key}) : super(key: key);

  RelatorioController relatorioController = Get.find();

  final pages = [
    RelatorioNaoLocalizados(),
    RelatorioIdentificacaoLocal(),
    RelatorioOciosos(),
    RelatorioInseriveis(),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
          child: RelatorioMenu(
            onTap1: () {
              relatorioController.currentPage.value = 0;
            },
            onTap2: () {
              relatorioController.currentPage.value = 1;
            },
            onTap3: () {
              relatorioController.currentPage.value = 2;
            },
            onTap4: () {
              relatorioController.currentPage.value = 3;
            },
          ),
        ),
        const SizedBox(height: 50),
        Expanded(
          child: Obx(
            () => pages[relatorioController.currentPage.value],
          ),
        ),
      ],
    );
  }
}