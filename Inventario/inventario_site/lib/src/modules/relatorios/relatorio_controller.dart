// ignore_for_file: unnecessary_overrides

import 'dart:io';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/home/home_controller.dart';
import 'package:shared/constantes/app_text.dart';
import 'package:shared/shared.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_file/open_file.Dart';

class RelatorioController extends GetxController {
  HomeController homeController = Get.find();

  var currentPage = 0.obs;
  void setPage(int index) {
    currentPage.value = index;
  }

  var isLoading = false.obs;

  Future<List<ModelPatrimonio>> relatorioNaoEncontrado() async {
    List<ModelPatrimonio> patrimonios = [];
    try {
      isLoading.value = true;
      patrimonios = await ModelPatrimonio.relatorioNaoEncontrado();
      isLoading.value = false;
      return patrimonios;
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  creatPdf(List<ModelPatrimonio> listPatrimonio, String titulo) async {
    final pdf = pw.Document();

    pdf.addPage(pw.MultiPage(
        build: (context) => [
              pw.Center(
                child: pw.Text(titulo),
              ),
              pw.Table.fromTextArray(data: <List<String>>[
                <String>[
                  'Item',
                  'Setor',
                  'N°. Patrimônio',
                  'Descrição do bem',
                  'Valor'
                ],
                ...listPatrimonio.map((patrimonio) => [
                      patrimonio.idBem.toString(),
                      homeController.listLocal
                          .firstWhere(
                              (local) => local.idLocal == patrimonio.idLocal)
                          .dsLocal
                          .toString(),
                      patrimonio.nmPatrimonio.toString(),
                      patrimonio.dsPatrimonio,
                      patrimonio.vlPatrimonio.toString(),
                    ])
              ])
            ]));

    final String dir = (await getApplicationDocumentsDirectory()).path;

    final String path = '$dir/relatorioNaoEncontrados.pdf';
    final File file = File(path);
    file.writeAsBytesSync(await pdf.save());
    OpenFile.open(file.path);
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
