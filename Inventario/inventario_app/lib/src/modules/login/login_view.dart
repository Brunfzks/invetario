import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/constantes/app_color.dart';

import 'login_controller.dart';
import 'widget/clipper/clipper_login.dart';
import 'widget/login_form/login_form.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceInfo = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: deviceInfo.size.width,
                  height: deviceInfo.size.height,
                  child: ClipPath(
                    clipper: CustomClipperLogin(),
                    child: Container(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                Container(
                    width: deviceInfo.size.width,
                    height: deviceInfo.size.height,
                    child: Center(child: LoginForm()))
              ],
            ),
          ),
        ));
  }
}
