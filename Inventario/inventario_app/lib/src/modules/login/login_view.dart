import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/constantes/app_color.dart';

import 'login_controller.dart';
import 'widget/login_form/login_form.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                const Color(0xFF55B342),
                AppColors.primary,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: LoginForm(),
      ),
    ));
  }
}
