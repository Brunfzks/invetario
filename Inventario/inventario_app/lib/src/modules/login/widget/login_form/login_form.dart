import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:inventario_app/shared/widgets/editor/editor.dart';
import 'package:inventario_app/src/modules/login/login_controller.dart';
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

  _title() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'BEM VINDO AO ',
            textAlign: TextAlign.left,
            style: AppText.textSecondTitleHome,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'RASP!',
            textAlign: TextAlign.center,
            style: AppText.textTitleHome,
          )
        ],
      ),
    );
  }

  _head() {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              AppColors.primary,
              const Color(0xFF4EB87A),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: SvgPicture.asset(
                'assets/logoIf_60.svg',
                height: 70,
              ),
            ),
            const Spacer(),
            _title(),
            const Spacer(),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    var display = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: SizedBox(
          height: display.size.height - 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _head(),
              const Spacer(),
              Editor(
                validator: RequiredValidator(
                    errorText: "Por favor, informe o usuário!"),
                width: display.size.width - 80,
                label: 'Prontuário',
                controller: widget.loginController.userLoginTextController,
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(
                () => Editor(
                  validator: RequiredValidator(
                      errorText: "Por favor, informe a senha!"),
                  width: display.size.width - 80,
                  label: 'Senha',
                  controller: widget.loginController.userSenhaTextController,
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
                  isPassword: widget.loginController.showPassword.value,
                ),
              ),
              Obx(
                () => widget.loginController.wrongPassword.value
                    ? Text('Usuário ou senha incorretos',
                        style: AppText.errorTextMobile)
                    : Container(),
              ),
              const SizedBox(
                height: 50,
              ),
              const Spacer(),
              ButtonForm(
                onTap: () async {
                  widget.loginController.wrongPassword.value = false;
                  if (_formKey.currentState!.validate()) {
                    try {
                      widget.loginController.login();
                    } catch (e) {
                      widget.loginController.wrongPassword.value = true;
                    }
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
