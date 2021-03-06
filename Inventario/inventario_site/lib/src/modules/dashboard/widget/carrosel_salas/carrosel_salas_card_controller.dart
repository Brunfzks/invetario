// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:shared/shared.dart';

class CarroselSalaCardController extends GetxController {

  CarroselSalaCardController({
      required this.local,
    });
  ModelLocal local;
  late var percentualConcluido = 0.0.obs;

  getPercentual() async {
    percentualConcluido.value = await ModelLocal.getPercentualConcluido(local.idLocal!);
  }
  
  @override
  void onInit() {
    // chamado imediatamente após o widget ser alocado em memória
    super.onInit();
  }

  @override
  void onReady() {
    // chamado depois que o widget é renderizado na tela
    super.onReady();
  }

  @override
  void onClose() {
    // chamado pouco antes do controlador ser excluído da memória
    super.onClose();
  }
}
