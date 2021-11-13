// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/home/home_controller.dart';
import 'package:inventario_site/src/modules/relatorios/relatorio_controller.dart';
import 'package:inventario_site/src/modules/relatorios/tipo_relatorios/widget/card_relatorio_local.dart';
import 'package:inventario_site/src/modules/relatorios/tipo_relatorios/widget/card_relatorio_patrimonio.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';
import 'package:shared/shared.dart';

class RelatorioOciosos extends StatefulWidget {
  RelatorioOciosos({Key? key}) : super(key: key);

  @override
  State<RelatorioOciosos> createState() => _RelatorioOciososState();
}

class _RelatorioOciososState extends State<RelatorioOciosos> {
  @override
  void initState() {
    super.initState();
    relatorioInserviveis();
  }

  List<ModelPatrimonio> listPatrimonio = [];

  RelatorioController relatorioController = Get.find();

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => relatorioController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () async {
                            await relatorioInserviveis();
                            relatorioController.creatPdf(
                                listPatrimonio, 'Ociosos');
                          },
                          child: Container(
                            width: 200,
                            height: 50,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              'Gerar PDF',
                              style: AppText.buttonText,
                            )),
                          ),
                        ),
                      )),
                  Expanded(
                    flex: 8,
                    child: ListView.builder(
                        itemCount: listPatrimonio.length,
                        itemBuilder: (context, index) {
                          return CardRelatorioNaoEncontrado(
                            modelPatrimonio: listPatrimonio[index],
                          );
                        }),
                  ),
                ],
              ),
            ),
    );
  }

  relatorioInserviveis() async {
    listPatrimonio.clear();
    homeController.listLevantamento.forEach((levantamento) {
      if (levantamento.Status == 'OCIOSO') {
        listPatrimonio.add(homeController.listPatrimonio
            .firstWhere((element) => element.idBem == levantamento.idBem));
      }
    });
  }
}
