import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:inventario_app/shared/widgets/editor/editor.dart';
import 'package:inventario_app/shared/widgets/title.dart';
import 'package:inventario_app/src/modules/login/login_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';

import 'button_login_form.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);
  final LoginController loginController = Get.find();

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var display = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: SizedBox(
            width: display.size.width,
            height: display.size.height - 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                TitlePage(
                    primaryText: 'BEM VINDO AO ',
                    secondText: 'RASP!',
                    subTitle: 'RASTREAMENTO DE PATRIMÔNIOS'),
                const Spacer(),
                Lottie.asset('assets/anim_login.json', height: 250),
                const SizedBox(
                  height: 50,
                ),
                Editor(
                  label: 'Prontuário',
                  controller: widget.loginController.userLoginTextController,
                  textCapitalization: TextCapitalization.characters,
                  validator: RequiredValidator(
                      errorText: "Por favor, informe o usuário!"),
                  width: display.size.width - 80,
                  onChanged: (e) {
                    widget.loginController.userSave.value = false;
                  },
                  onFieldSubmitted: (v) {},
                ),
                Obx(
                  () => widget.loginController.userSave.value == false
                      ? Editor(
                          label: 'Senha',
                          controller:
                              widget.loginController.userSenhaTextController,
                          sufix: InkWell(
                            onTap: () {
                              widget.loginController.showPasswords();
                            },
                            child: Icon(
                              widget.loginController.showPassword.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.primary,
                            ),
                          ),
                          onFieldSubmitted: (v) {
                            _validaLogin();
                          },
                          validator: RequiredValidator(
                              errorText: "Por favor, informe a senha!"),
                          width: display.size.width - 80,
                          isPassword: widget.loginController.showPassword.value,
                        )
                      : Container(),
                ),
                Obx(
                  () => widget.loginController.wrongPassword.value
                      ? Text('Usuário ou senha incorretos',
                          style: AppText.errorTextMobile)
                      : Container(),
                ),
                const Spacer(),
                ButtonForm(
                  onTap: () async {
                    _validaLogin();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _validaLogin() {
    widget.loginController.wrongPassword.value = false;
    if (widget.loginController.userSave.value ||
        _formKey.currentState!.validate()) {
      try {
        widget.loginController.login();
      } catch (e) {
        widget.loginController.wrongPassword.value = true;
      }
    }
  }
}
