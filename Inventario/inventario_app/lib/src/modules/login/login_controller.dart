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
  final LocalAuthentication _localAuthentication = LocalAuthentication();

  TextEditingController userLoginTextController = TextEditingController();
  TextEditingController userSenhaTextController = TextEditingController();

  var showPassword = true.obs;
  var wrongPassword = false.obs;

  @override
  void onInit() {
    userSave();
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

  Future<void> login({user, senha}) async {
    try {
      if (user == null && senha == null) {
        user = userLoginTextController.text;
        senha = userSenhaTextController.text;
      }

      ModelUsuario usuario = await ModelUsuario.getUsuario(user, senha);

      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('ptUsuario', usuario.ptUsuario);
      await prefs.setString('snUsuario', usuario.snUsuario);

      final HomeController homeController =
          Get.put(HomeController(usuario: usuario));
      Get.to(() => HomePage());
    } catch (e) {
      rethrow;
    }
  }

  userSave() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    ptUsuario = (prefs.getString('ptUsuario') ?? "");
    snUsuario = (prefs.getString('snUsuario') ?? "");

    if (ptUsuario != "" && snUsuario != "") {
      print('User save');
      userLoginTextController.text = ptUsuario;

      authenticateWithBiometrics();
    }
  }

  authenticateWithBiometrics() async {
    print('Entrou validação plea biometria');
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
      login(user: ptUsuario, senha: snUsuario);
    }
  }

  showPasswords() {
    showPassword.value = !showPassword.value;
  }
}
