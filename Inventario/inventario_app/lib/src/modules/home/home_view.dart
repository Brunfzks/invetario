import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_app/shared/widgets/title.dart';
import 'package:inventario_app/src/modules/home/home_controller.dart';
import 'package:inventario_app/src/modules/home/notificacoes/notificacoes_view.dart';
import 'package:shared/constantes/app_color.dart';

import 'locais/locais_view.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      key: homeController.scaffoldKey,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TitlePage(
                primaryText: 'BEM VINDO, ',
                secondText: homeController.usuario.nmUsuario.toUpperCase(),
                subTitle: 'SUA ÁREA',
                padding: false,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Obx(
              () => homeController.notificacao.isNotEmpty
                  ? Notificacoes()
                  : Container(),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(child: Locais())
          ],
        ),
      ),
    );
  }
}
