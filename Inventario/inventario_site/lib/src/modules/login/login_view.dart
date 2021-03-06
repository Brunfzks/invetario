// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/login/login_controller.dart';
import 'package:inventario_site/src/modules/login/widget/login_form/clipper/clipper_login.dart';
import 'package:inventario_site/src/modules/login/widget/login_form/login_form.dart';
import 'package:shared/constantes/app_color.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          width: deviceInfo.size.width * 0.4,
          child: ClipPath(
            clipper: CustomClipperLogin(),
            child: Container(
              color: AppColors.primary,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(),
              ),
              Expanded(
                child: LoginForm(),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
