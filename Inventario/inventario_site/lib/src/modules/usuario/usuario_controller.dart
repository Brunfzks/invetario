import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared/shared.dart';

class UsuarioController extends GetxController {
  TextEditingController nomeTextController = TextEditingController();
  TextEditingController senhaTextController = TextEditingController();
  TextEditingController prontuarioTextController = TextEditingController();
  TextEditingController campusTextController = TextEditingController();
  TextEditingController setorTextController = TextEditingController();

  Future<int> cadastraUsuario() async {
    ModelUsuario usuario = ModelUsuario(
      snUsuario: senhaTextController.text,
      cpOrigem: campusTextController.text,
      dsSetor: setorTextController.text,
      ptUsuario: prontuarioTextController.text,
      nmUsuario: nomeTextController.text,
    );
    try {
      int idUsuario = await ModelUsuario.cadastraUsuario(usuario);
      return idUsuario;
    } catch (e) {
      rethrow;
    }
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
