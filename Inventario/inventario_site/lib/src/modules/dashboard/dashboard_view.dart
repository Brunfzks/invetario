// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/dashboard/widget/carrosel_salas/carrosel_salas_card.dart';
import 'package:inventario_site/src/modules/dashboard/widget/carrosel_salas/carrosel_salas_card_controller.dart';
import 'package:inventario_site/src/modules/home/home_controller.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: homeController.listLocal.length,
              itemBuilder: (context, index) {
                return CarroselSalaCard(
                  controller: CarroselSalaCardController(
                    local: homeController.listLocal[index],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
