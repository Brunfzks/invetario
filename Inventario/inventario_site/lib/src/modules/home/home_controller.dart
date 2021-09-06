import 'package:get/get.dart';
import 'package:shared/shared.dart';

class HomeController extends GetxController {
  HomeController({required this.usuario});

  final ModelUsuario usuario;

  var currentPage = 0.obs;
  var oofSetTopMenu = 240.0.obs;
  var oofSetBottomMenu = 395.0.obs;

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
  }

  @override
  void onClose() {
    // chamado pouco antes do controlador ser excluído da memória
    super.onClose();
  }
}
