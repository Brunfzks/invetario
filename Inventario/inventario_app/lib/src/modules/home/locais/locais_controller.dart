import 'package:get/get.dart';
import 'package:shared/shared.dart';

class LocalController extends GetxController {
  LocalController();

  RxBool loading = RxBool(true);
  late List<ModelPatrimonio> patrimonios = <ModelPatrimonio>[].obs;

  @override
  Future<void> onInit() async {
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

  Future<List<ModelPatrimonio>> getPatrimonios({required int Id_local}) async {
    loading.value = true;
    return ModelPatrimonio.getPatrimonios(Id_local: Id_local).then((value) {
      loading.value = false;
      return value;
    });
  }
}
