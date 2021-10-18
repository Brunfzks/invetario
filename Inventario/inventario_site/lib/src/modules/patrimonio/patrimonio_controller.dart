import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/home/home_controller.dart';
import 'package:shared/shared.dart';

class PatrimonioController extends GetxController {
  TextEditingController dsRotuloTextController = TextEditingController();
  TextEditingController dsEdTextController = TextEditingController();
  TextEditingController dsCampusTextController = TextEditingController();
  TextEditingController vlPatrimonioTextController = TextEditingController();
  TextEditingController nmPatrimonioTextController = TextEditingController();
  TextEditingController dsPatrimonioTextController = TextEditingController();
  TextEditingController nmNotaFiscaTextController = TextEditingController();
  TextEditingController stConservacaoTextController = TextEditingController();
  TextEditingController nmSerieTextController = TextEditingController();
  TextEditingController nmFornecedorTextController = TextEditingController();
  TextEditingController dsMarcaTextController = TextEditingController();
  TextEditingController empenhoTextController = TextEditingController();
  TextEditingController tpIngressoTextController = TextEditingController();

  HomeController homeController = Get.find();

  var selectedLocal = 0.obs;
  var isLoading = false.obs;

  limpaControllers() {
    dsRotuloTextController.text = '';
    dsEdTextController.text = '';
    dsCampusTextController.text = '';
    vlPatrimonioTextController.text = '';
    nmPatrimonioTextController.text = '';
    dsPatrimonioTextController.text = '';
    nmNotaFiscaTextController.text = '';
    stConservacaoTextController.text = '';
    nmSerieTextController.text = '';
    nmFornecedorTextController.text = '';
    dsMarcaTextController.text = '';
    empenhoTextController.text = '';
    tpIngressoTextController.text = '';
  }

  Future<ModelPatrimonio> cadastraParimonio() async {
    isLoading.value = true;
    ModelPatrimonio patrimonio = ModelPatrimonio(
      dsCampus: dsCampusTextController.text,
      dsMarca: dsMarcaTextController.text,
      dsPatrimonio: dsPatrimonioTextController.text,
      dsRotulo: dsRotuloTextController.text,
      dtEntrada: DateTime.now().toIso8601String().substring(0, 10),
      empenho: int.parse(empenhoTextController.text),
      idLocal: homeController.listLocal[selectedLocal.value].idLocal!,
      nmFornecedor: nmFornecedorTextController.text,
      nmNotaFiscal: nmNotaFiscaTextController.text,
      nmPatrimonio: int.parse(nmPatrimonioTextController.text),
      nmSerie: nmSerieTextController.text,
      stConservacao: stConservacaoTextController.text,
      tpIngresso: tpIngressoTextController.text,
      vlPatrimonio: double.parse(vlPatrimonioTextController.text),
      dsEd: int.parse(dsEdTextController.text),
    );
    try {
      patrimonio.idBem = await ModelPatrimonio.cadastraPatrimonio(patrimonio);
      isLoading.value = false;
      homeController.listPatrimonio.add(patrimonio);
      return patrimonio;
    } catch (e) {
      isLoading.value = false;
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
