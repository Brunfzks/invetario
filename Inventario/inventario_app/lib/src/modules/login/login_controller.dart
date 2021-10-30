import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_app/src/modules/home/home_controller.dart';
import 'package:inventario_app/src/modules/home/home_view.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  String ptUsuario = "";
  String snUsuario = "";
  var userSave = false.obs;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController userLoginTextController = TextEditingController();
  TextEditingController userSenhaTextController = TextEditingController();

  var showPassword = true.obs;
  var wrongPassword = false.obs;

  @override
  void onInit() async {
    userSave.value = await checkUserSave();
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

  _autenticar({
    user,
    senha,
  }) async {
    try {
      if (user == null && senha == null) {
        user = userLoginTextController.text;
        senha = userSenhaTextController.text;
      }

      ModelUsuario usuario = await ModelUsuario.getUsuario(user, senha);

      if (usuario.idLevantamento != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        await prefs.setString('ptUsuario', usuario.ptUsuario);
        await prefs.setString('snUsuario', usuario.snUsuario);

        final HomeController homeController =
            Get.put(HomeController(usuario: usuario));
        Get.to(() => HomePage());
      } else {
        print('AQUII');
        _snack(
            text:
                "Não foi possivel realizar o login pois não existe um processo "
                "de auditoria iniciado. Contate o administrador do sistema.",
            color: Colors.red);
      }
    } catch (e) {
      rethrow;
    }
  }

  _snack({text, color}) {
    scaffoldKey.currentState!.removeCurrentSnackBar();
    return scaffoldKey.currentState!.showSnackBar(SnackBar(
      content: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 10),
      backgroundColor: color,
    ));
  }

  Future<void> login({
    user,
    senha,
  }) async {
    if (userSave.value) {
      authenticateWithBiometrics();
    } else {
      _autenticar(
        user: user,
        senha: senha,
      );
    }
  }

  Future<bool> checkUserSave() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    ptUsuario = (prefs.getString('ptUsuario') ?? "");
    snUsuario = (prefs.getString('snUsuario') ?? "");

    if (ptUsuario != "" && snUsuario != "") {
      print('User save');
      userLoginTextController.text = ptUsuario;
      return true;
    } else {
      return false;
    }
  }

  Future<bool> authenticateWithBiometrics() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    bool isAuthenticated = false;

    print(
        'isBiometricSupported $isBiometricSupported canCheckBiometrics $canCheckBiometrics');

    if (isBiometricSupported && canCheckBiometrics) {
      print('Biometria habilitada');
      isAuthenticated = await localAuthentication.authenticate(
        localizedReason: 'Toque no sensor para realizar o login',
        biometricOnly: true,
      );
    }

    if (isAuthenticated) {
      _autenticar(
        user: ptUsuario,
        senha: snUsuario,
      );
      return true;
    } else {
      return false;
    }
  }

  showPasswords() {
    showPassword.value = !showPassword.value;
  }
}
