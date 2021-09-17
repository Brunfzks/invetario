import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/home/home_controller.dart';
import 'package:shared/shared.dart';

class LocalController extends GetxController {
  HomeController homeController = Get.find();
  var selectedUsuario = 0.obs;

  var isLoading = false.obs;

  List<ModelLocal> locais = [];
  TextEditingController descricaoTextController = TextEditingController();

  void limpaControllers() {
    descricaoTextController.text = '';
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

  Future<List<ModelLocal>> getLocais(int idUsuario) async {
    locais = await ModelLocal.getLocais(idUsuario);
    return locais;
  }

  Future<ModelLocal> cadastraLocal() async {
    isLoading.value = true;
    ModelLocal local = ModelLocal(
        dsLocal: descricaoTextController.text,
        idUsuario:
            homeController.listUsuario[selectedUsuario.value].idUsuario!);
    try {
      local.idLocal = await ModelLocal.cadastraLocais(local);
      isLoading.value = false;
      homeController.listLocal.add(local);
      return local;
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }
}
