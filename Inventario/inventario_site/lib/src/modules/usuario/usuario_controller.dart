import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/home/home_controller.dart';
import 'package:shared/shared.dart';

class UsuarioController extends GetxController {
  TextEditingController nomeTextController = TextEditingController();
  TextEditingController senhaTextController = TextEditingController();
  TextEditingController prontuarioTextController = TextEditingController();
  TextEditingController campusTextController = TextEditingController();
  TextEditingController setorTextController = TextEditingController();

  HomeController homeController = Get.find();

  var isLoading = false.obs;

  Future<List<ModelUsuario>> getUsuarios() async {
    homeController.listUsuario.value = await ModelUsuario.getUsuarios();
    return homeController.listUsuario;
  }

  Future<int> cadastraUsuario() async {
    isLoading.value = true;
    ModelUsuario usuario = ModelUsuario(
      snUsuario: senhaTextController.text,
      cpOrigem: campusTextController.text,
      dsSetor: setorTextController.text,
      ptUsuario: prontuarioTextController.text,
      nmUsuario: nomeTextController.text,
    );
    try {
      usuario.idUsuario = await ModelUsuario.cadastraUsuario(usuario);
      homeController.listUsuario.add(usuario);
      isLoading.value = false;
      return usuario.idUsuario!;
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  void limpaControllers() {
    senhaTextController.text = '';
    campusTextController.text = '';
    setorTextController.text = '';
    prontuarioTextController.text = '';
    nomeTextController.text = '';
  }

  Future<bool> existeUsuario(String prontuario) async {
    try {
      if (await ModelUsuario.existeUsuario(prontuario)) {
        return true;
      }
      return false;
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
