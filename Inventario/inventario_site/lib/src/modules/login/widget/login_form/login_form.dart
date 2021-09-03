import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventario_site/shared/widgets/editor/editor.dart';
import 'package:inventario_site/src/modules/login/login_controller.dart';
import 'package:inventario_site/src/modules/login/widget/login_form/button_login_form.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_images.dart';
import 'package:shared/constantes/app_text.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);
  LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 500,
      child: Center(
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              child: SvgPicture.asset('assets/logoif_60.svg'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Bem Vindo',
              style: AppText.title,
            ),
            Editor(
              width: 400,
              label: 'Usuário',
              controller: controller.userLoginTextController,
              prefix: Icon(
                Icons.person,
                color: AppColors.primary,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Obx(
              () => Editor(
                width: 400,
                label: 'Senha',
                controller: controller.userSenhaTextController,
                prefix: Icon(
                  Icons.lock,
                  color: AppColors.primary,
                ),
                sufix: InkWell(
                  onTap: () {
                    controller.showPasswords();
                  },
                  child: Icon(
                    controller.showPassword.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.primary,
                  ),
                ),
                isPassword: controller.showPassword.value,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ButtonForm(),
          ],
        ),
      ),
    );
  }
}
