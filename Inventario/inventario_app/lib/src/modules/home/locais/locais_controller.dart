import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';
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

  Future<void> startScan(
      {required int Id_Local,
      required int Id_Levantamento,
      required int Id_usuario,
      required context,
      required scaffoldKey,
      bool notificacao = false}) async {
    String? Nm_Patrimonio = await _permiteScan(context);

    print('RESULTADO SCANEADO: $Nm_Patrimonio');

    print('$Id_Local, $Nm_Patrimonio, $Id_Levantamento, $Id_usuario');
    String result = await ModelPatrimonio.insertLevantamento(
        Id_Local: Id_Local,
        Nm_Patrimonio: int.parse(Nm_Patrimonio!),
        Id_Levantamento: Id_Levantamento,
        Id_usuario: Id_usuario,
        notificacao: notificacao);

    print(result);
    bool restart = true;
    if (result == 'PATRIMONIO NAO CADASTRADO') {
      restart = await _showDialogScan(context, notificacao: false);
    } else if (result == 'NOTIFICACAO CRIADA!') {
      restart = await _showDialogScan(context, notificacao: true);
    } else if (result == 'INSERIDO COM SUCESSO!') {
      _snack(
        text: 'Verficação realizada com sucesso!',
        color: AppColors.primary,
        scaffoldKey: scaffoldKey,
      );
    }

    if (restart && !notificacao) {
      Future.delayed(const Duration(seconds: 2)).then((value) {
        startScan(
            Id_Local: Id_Local,
            Id_Levantamento: Id_Levantamento,
            Id_usuario: Id_usuario,
            context: context,
            scaffoldKey: scaffoldKey);
      });
    }
  }

  _snack({scaffoldKey, text, color}) {
    scaffoldKey.currentState.removeCurrentSnackBar();
    return scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: color,
    ));
  }

  Future<String?> _permiteScan(context) async {
    int permissao = await checkpermission_opencamera();

    switch (permissao) {
      case 1:
        return await scanner.scan();
      case 2:
        return _showDialog(context);
      default:
        return '';
    }
  }

  Future<int> checkpermission_opencamera() async {
    int ePermitido = 0;
    var cameraStatus = await Permission.camera.status;

    if (!cameraStatus.isGranted) await Permission.camera.request();

    if (await Permission.camera.isPermanentlyDenied) ePermitido = 2;

    if (await Permission.camera.isGranted) ePermitido = 1;

    return ePermitido;
  }

  Future<bool> _showDialogScan(BuildContext context,
      {required bool notificacao}) {
    bool restart = false;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              child: SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(
                      notificacao
                          ? 'assets/notificacao.json'
                          : 'assets/produto_nao_encontrado.json',
                      height: 250),
                  const SizedBox(
                    height: 25,
                  ),
                  Text(
                      notificacao
                          ? 'Parece que você encontrou um item que '
                              'deveria estar em outro local. Mas não se preocupe, '
                              'o responsavel pelo item acaba de ser notificado!'
                          : 'Hmm, parece que o item escaneado ainda não foi cadastrado. Estamos notificando o administrador...',
                      textAlign: TextAlign.center,
                      style: AppText.textPrimaryCardLocalHome),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Sair",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.red,
                      ),
                      RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          restart = true;
                        },
                        child: const Text(
                          "Continuar",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ));
        }).then((value) => restart);
  }

  Future<String?> _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              child: Container(
            height: 130,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Permitir utilização da câmera pelo aplicativo?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Cancelar",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.red,
                      ),
                      RaisedButton(
                        onPressed: () {
                          openAppSettings();
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "OK",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.green,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ));
        }).then((value) => _permiteScan(context));
  }
}
