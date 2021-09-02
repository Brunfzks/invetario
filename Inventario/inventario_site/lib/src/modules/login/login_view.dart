import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/login/login_controller.dart';
import 'package:inventario_site/src/modules/login/widget/login_form/login_form.dart';
import 'package:shared/constantes/app_color.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          width: double.infinity,
          child: SvgPicture.asset(
            'assets/fundo_login.svg',
            alignment: Alignment.topLeft,
            color: AppColors.primary,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(),
            ),
            Expanded(
              child: LoginForm(),
            ),
          ],
        )
      ],
    ));
  }
}
