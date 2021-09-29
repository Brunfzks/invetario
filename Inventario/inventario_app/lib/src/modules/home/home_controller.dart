import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';

class HomeController extends GetxController {
  HomeController({
    required this.usuario,
  });

  final ModelUsuario usuario;
  var notificacao = <ModelNotificacao>[].obs;
  var locais = <ModelLocal>[].obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Future<void> onInit() async {
    super.onInit();

    getNotificacoes();
    locais.value = await ModelLocal.getLocais(usuario.idUsuario!);
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

  getNotificacoes() async {
    notificacao.value =
        await ModelNotificacao.getNotificacoes(Id_Usuario: usuario.idUsuario!);
  }
}
