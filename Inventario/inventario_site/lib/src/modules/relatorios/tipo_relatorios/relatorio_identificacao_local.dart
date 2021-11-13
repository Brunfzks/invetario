// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/home/home_controller.dart';
import 'package:inventario_site/src/modules/relatorios/relatorio_controller.dart';
import 'package:inventario_site/src/modules/relatorios/tipo_relatorios/widget/card_relatorio_local.dart';
import 'package:inventario_site/src/modules/relatorios/tipo_relatorios/widget/card_relatorio_patrimonio.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';

class RelatorioIdentificacaoLocal extends StatefulWidget {
  RelatorioIdentificacaoLocal({Key? key}) : super(key: key);

  @override
  State<RelatorioIdentificacaoLocal> createState() =>
      _RelatorioIdentificacaoLocalState();
}

class _RelatorioIdentificacaoLocalState extends State<RelatorioIdentificacaoLocal> {

  @override
  void initState() {
    super.initState();
  }

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
                            relatorioController.creatPdfLocal(homeController.listLocal, 'Identificação do setor e responsável');
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
                        itemCount: homeController.listLocal.length,
                        itemBuilder: (context, index) {
                          return CardRelatorioIdentificacaoLocal(
                             modelLocal: homeController.listLocal[index],);
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}
