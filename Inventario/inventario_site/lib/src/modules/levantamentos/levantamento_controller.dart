// ignore_for_file: unnecessary_overrides
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/home/home_controller.dart';
import 'package:shared/shared.dart';

class LevantamentoController extends GetxController {
  HomeController homeController = Get.find();

  Future<List<LevantamentoModel>> getLevantamento() async {
    List<LevantamentoModel> list = [];
    list = await LevantamentoModel.getLevantamentos();
    homeController.listLevantamento.value = list;
    return list;
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
