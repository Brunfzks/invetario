import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:inventario_app/shared/widgets/editor/editor.dart';
import 'package:inventario_app/src/modules/home/home_controller.dart';
import 'package:inventario_app/src/modules/home/home_view.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';

import '../../login_controller.dart';
import 'button_login_form.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key? key}) : super(key: key);
  final LoginController controller = Get.find();

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: SvgPicture.asset(
                    'assets/logoIf_60.svg',
                    height: 100,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                _title(),
                const SizedBox(
                  height: 50,
                ),
                Editor(
                  validator: RequiredValidator(
                      errorText: "Por favor, informe o usuário!"),
                  width: 400,
                  label: 'Usuário',
                  controller: widget.controller.userLoginTextController,
                  prefix: Icon(
                    Icons.person,
                    size: 25,
                    color: AppColors.darkerText,
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
                    controller: widget.controller.userSenhaTextController,
                    prefix: Icon(
                      Icons.lock,
                      size: 25,
                      color: AppColors.darkerText,
                    ),
                    sufix: InkWell(
                      onTap: () {
                        widget.controller.showPasswords();
                      },
                      child: Icon(
                        widget.controller.showPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: AppColors.primary,
                      ),
                    ),
                    isPassword: widget.controller.showPassword.value,
                  ),
                ),
                Obx(
                  () => widget.controller.wrongPassword.value
                      ? Text('Usuário ou senha incorretos',
                          style: AppText.errorTextMobile)
                      : Container(),
                ),
                const SizedBox(
                  height: 50,
                ),
                ButtonForm(
                  onTap: () async {
                    widget.controller.wrongPassword.value = false;
                    if (_formKey.currentState!.validate()) {
                      try {
                        final homeContoller = Get.put(HomeController(
                            usuario: await widget.controller.login()));
                        Get.to(() => HomePage());
                      } catch (e) {
                        widget.controller.wrongPassword.value = true;
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
