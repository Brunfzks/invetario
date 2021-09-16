import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:inventario_app/shared/widgets/editor/editor.dart';
import 'package:inventario_app/src/modules/home/home_controller.dart';
import 'package:inventario_app/src/modules/home/home_view.dart';
import 'package:lottie/lottie.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';
import 'package:shared/shared.dart';

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

  _logo() {
    return Stack(
      children: [
        LottieBuilder.asset('assets/lupa.json'),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 50),
          child: const Text(
            'ASP!',
            style: TextStyle(fontSize: 90, color: Colors.grey),
          ),
        )
      ],
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
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: SvgPicture.asset(
                'assets/logoIf_60.svg',
                height: 70,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            _logo(),
            const SizedBox(
              height: 50,
            ),
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
                controller: widget.controller.userLoginTextController,
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
                  controller: widget.controller.userSenhaTextController,
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
              const Spacer(),
              ButtonForm(
                onTap: () async {
                  widget.controller.wrongPassword.value = false;
                  if (_formKey.currentState!.validate()) {
                    try {
                      ModelUsuario usuario = await widget.controller.login();
                      final HomeController homeContoller =
                          Get.put(HomeController(usuario: usuario));
                      Get.to(() => HomePage());
                    } catch (e) {
                      widget.controller.wrongPassword.value = true;
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
