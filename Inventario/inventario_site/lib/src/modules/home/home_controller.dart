import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/levantamentos/levantamento_controller.dart';
import 'package:inventario_site/src/modules/local/local_controller.dart';
import 'package:inventario_site/src/modules/patrimonio/patrimonio_controller.dart';
import 'package:inventario_site/src/modules/relatorios/relatorio_controller.dart';
import 'package:inventario_site/src/modules/usuario/usuario_controller.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/shared.dart';

class HomeController extends GetxController {
  HomeController({required this.usuario});
  //usuario
  final ModelUsuario usuario;
  var listUsuario = <ModelUsuario>[].obs;
  //usuario end

  //local
  var listLocal = <ModelLocal>[].obs;
  //local end

  //patrimonio
  var listPatrimonio = <ModelPatrimonio>[].obs;
  //patrimonio end

  //levantamento
  var listLevantamento = <LevantamentoModel>[].obs;
  //levantamento end

  //alert
  var isShowAlert = false.obs;
  var textAlert = 'TESTE'.obs;
  var colorAlert = AppColors.errorColor.obs;
  var iconAlert = Icons.error.obs;
  var positionAlert = 0.0.obs;
  var isLevantamentoOpen = false.obs;
  void showAlert({
    required String textAlert,
    required var colors,
    required IconData icon,
  }) async {
    this.textAlert.value = textAlert;
    colorAlert.value = colors;
    iconAlert.value = icon;
    isShowAlert.value = true;
    positionAlert.value = 100;
    Timer(
      const Duration(seconds: 5),
      () {
        positionAlert.value = -1;
        isShowAlert.value = false;
      },
    );
  }

  getCablevantamento() async {
    try {
      CabLevantamentoModel cabLentamento =
          await CabLevantamentoModel.getLevantamentos();
          isLevantamentoOpen.value = true;
      
    } catch (e) {
      isLevantamentoOpen.value = false;
    }
  }

  //alert end
  var currentPage = 0.obs;
  void setPage(int index) {
    currentPage.value = index;
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
    //controller
    UsuarioController usuarioController = Get.find();
    LocalController localController = Get.find();
    RelatorioController relatorioController = Get.find();
    LevantamentoController levantamentoController = Get.find();
    PatrimonioController patrimonioController = Get.find();
    patrimonioController.getAllPatrimonio();
    levantamentoController.getLevantamento();
    localController.getLocaisAll();
    usuarioController.getUsuarios();

    //controller end
  }

  @override
  void onClose() {
    // chamado pouco antes do controlador ser excluído da memória
    super.onClose();
  }
}
