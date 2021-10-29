import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_app/shared/widgets/title.dart';
import 'package:inventario_app/src/modules/home/locais/locais_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';

class ClassificacaoDialog extends StatelessWidget {
  ClassificacaoDialog({Key? key}) : super(key: key);

  final LocalController localController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitlePage(
            primaryText: 'Chegou a hora de ',
            secondText: 'Classificar!',
            subTitle: 'Escolha uma das opções abaixo'),
        const SizedBox(
          height: 25,
        ),
        Lottie.asset('assets/anim_rating.json', height: 250),
        const SizedBox(
          height: 25,
        ),
        Obx(() => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _button('ativo'),
                    _button('ocioso'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _button('inservível'),
                    _button('não tombado'),
                  ],
                ),
              ],
            )),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }

  _button(String text) {
    bool selecionado = false;
    if (localController.classificacaoSelecionada.value == text) {
      selecionado = true;
    } else {
      selecionado = false;
    }

    return GestureDetector(
      onTap: () {
        localController.classificacaoSelecionada.value = text;
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: 60,
        width: 100,
        decoration: BoxDecoration(
          color: selecionado ? AppColors.primary : Colors.transparent,
          border: Border.all(
              color: selecionado ? AppColors.primary : AppColors.textColor!),
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Center(
          child: Text(
            text.toUpperCase(),
            textAlign: TextAlign.center,
            style: selecionado
                ? AppText.textPrimaryCardLocalHomeWhite
                : AppText.textPrimaryCardLocalHome,
          ),
        ),
      ),
    );
  }
}
