// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/dashboard/widget/carrosel_salas/carrosel_salas_card.dart';
import 'package:inventario_site/src/modules/dashboard/widget/carrosel_salas/carrosel_salas_card_controller.dart';
import 'package:inventario_site/src/modules/home/home_controller.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';
import 'package:shared/shared.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => SingleChildScrollView(
          child: homeController.isLevantamentoOpen.value
              ? Column(
                  children: [
                    InkWell(
                      onTap: () async {
                        await CabLevantamentoModel.atualizaLevantamentos(homeController.usuario.idUsuario!, true, true);
                        homeController.isLevantamentoOpen.value = false;
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Center(
                            child: Text(
                          'Encerrar auditoria',
                          style: AppText.buttonText,
                        )),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: GridView.count(
                        crossAxisCount: 4,
                        children: List.generate(homeController.listLocal.length,
                            (index) {
                          return CarroselSalaCard(
                            controller: CarroselSalaCardController(
                              local: homeController.listLocal[index],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Center(
                      child: Text(
                        'Não existe um processo de auditoria aberto!',
                        style: AppText.textTitleHome,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () async {
                        await CabLevantamentoModel.atualizaLevantamentos(homeController.usuario.idUsuario!, false, false);
                        homeController.isLevantamentoOpen.value = true;
                      },
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Center(
                            child: Text(
                          'Iniciar Auditoria',
                          style: AppText.buttonText,
                        )),
                      ),
                    )
                  ],
                ),
        ));
  }
}
