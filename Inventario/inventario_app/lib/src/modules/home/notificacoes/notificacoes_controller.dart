import 'package:get/get.dart';
import 'package:shared/shared.dart';

class NotificacoesController extends GetxController {
  NotificacoesController({required this.notificacao});

  final ModelNotificacao notificacao;

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
