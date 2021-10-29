import 'package:date_format/date_format.dart';
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
  var showNotifications = true.obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Future<void> onInit() async {
    super.onInit();

    getNotificacoes();
    getLocais();
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

  getLocais() async {
    locais.value = await ModelLocal.getLocais(usuario.idUsuario!);
  }

  static ConvertData(String data) {
    try {

      return formatDate(DateTime.parse(data), ["dd/MM/yyyy"]);
    } catch (e) {
      return data;
    }
  }

  showHideNotifications() {
    showNotifications.value = !showNotifications.value;
  }
}
