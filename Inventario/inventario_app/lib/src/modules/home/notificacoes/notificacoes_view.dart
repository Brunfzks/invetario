import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_app/src/modules/home/home_controller.dart';
import 'package:shared/constantes/app_theme.dart';
import 'package:shared/shared.dart';

class Notificacoes extends StatelessWidget {
  Notificacoes({Key? key}) : super(key: key);

  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    print(homeController.notificacao.length);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Notificações',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22,
            letterSpacing: 0.27,
            color: AppTheme.darkerText,
          ),
        ),
        Obx(
          () => ListView(
            shrinkWrap: true,
            children: homeController.notificacao
                .map(
                  (model) => Container(
                    child: _cardNotificacao(model),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  _cardNotificacao(ModelNotificacao model) {
    return Card(
      color: Colors.red,
      child: Text(model.dsPatrimonio),
    );
  }
}
