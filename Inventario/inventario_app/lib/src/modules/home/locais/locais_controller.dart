import 'package:flutter/services.dart';
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
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<List<ModelPatrimonio>> getPatrimonios({required int Id_local}) async {
    loading.value = true;
    patrimonios = [];

    patrimonios = await ModelPatrimonio.getPatrimonios(Id_local: Id_local);
    loading.value = false;

    return patrimonios;
  }



  startScan({
    required int Id_Local,
    required int Id_Levantamento,
    required int Id_usuario,
  }) async {
    String? Nm_Patrimonio ='';// await scanner.scan();

    print('RESULTADO SCANEADO: $Nm_Patrimonio');

    String result = await ModelPatrimonio.insertLevantamento(
        Id_Local: Id_Local,
        Nm_Patrimonio: int.parse(Nm_Patrimonio!),
        Id_Levantamento: Id_Levantamento,
        Id_usuario: Id_usuario);

    print(result);

    if (result == 'PATRIMONIO NAO CADASTRADO') {
    } else if (result == 'NOTIFICACAO CRIADA!') {
    } else if (result == 'INSERIDO COM SUCESSO!') {}
  }
}
