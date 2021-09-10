import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:inventario_app/shared/widgets/editor/editor.dart';
import 'package:inventario_app/src/modules/home/home_controller.dart';
import 'package:inventario_app/src/modules/home/home_view.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';
import 'package:shared/constantes/app_theme.dart';

import '../../login_controller.dart';
import 'button_login_form.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);
  final LoginController controller = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 500,
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: SvgPicture.asset('assets/logoif_60.svg'),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Bem Vindo',
                style: AppTheme.display1,
              ),
              Editor(
                validator: RequiredValidator(
                    errorText: "Por favor, informe o usuário!"),
                width: 400,
                label: 'Usuário',
                controller: controller.userLoginTextController,
                prefix: Icon(
                  Icons.person,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(
                () => Editor(
                  validator: RequiredValidator(
                      errorText: "Por favor, informe a senha!"),
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
              Obx(
                () => controller.wrongPassword.value
                    ? Text('Usuário ou senha incorretos',
                        style: AppText.errorText)
                    : Container(),
              ),
              const SizedBox(
                height: 50,
              ),
              ButtonForm(
                onTap: () async {
                  controller.wrongPassword.value = false;
                  if (_formKey.currentState!.validate()) {
                    try {
                      final homeContoller = Get.put(
                          HomeController(usuario: await controller.login()));
                      Get.to(() => HomePage());
                    } catch (e) {
                      controller.wrongPassword.value = true;
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
