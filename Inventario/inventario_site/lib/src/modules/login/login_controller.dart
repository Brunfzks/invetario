import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/home/home_controller.dart';
import 'package:shared/shared.dart';

class LoginController extends GetxController {
  TextEditingController userLoginTextController = TextEditingController();
  TextEditingController userSenhaTextController = TextEditingController();
  var showPassword = true.obs;
  var wrongPassword = false.obs;

  Future<ModelUsuario> login() async {
    try {
      ModelUsuario usuario = await ModelUsuario.getUsuario(
          userLoginTextController.text, userSenhaTextController.text);
      return usuario;
    } catch (e) {
      rethrow;
    }
  }

  showPasswords() {
    showPassword.value = !showPassword.value;
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
