import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:inventario_site/shared/widgets/editor/editor.dart';
import 'package:inventario_site/src/modules/cadastros/cadastro_controller.dart';
import 'package:inventario_site/src/modules/usuario/usuario_controller.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_theme.dart';

class CadastroUsuarioForm extends StatelessWidget {
  CadastroUsuarioForm({Key? key}) : super(key: key);

  UsuarioController usuarioController = Get.put(UsuarioController());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Editor(
              label: 'Nome',
              controller: usuarioController.nomeTextController,
              validator: RequiredValidator(
                  errorText: "Por favor, informe o nome do usuário"),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: Editor(
                    label: 'Prontuario',
                    controller: usuarioController.prontuarioTextController,
                    validator: RequiredValidator(
                        errorText: "Por favor, informe o Prontuario"),
                  ),
                ),
                Expanded(
                  child: Editor(
                    label: 'Campus',
                    controller: usuarioController.campusTextController,
                    validator: RequiredValidator(
                        errorText: "Por favor, informe o Campus do usuário"),
                  ),
                ),
                Expanded(
                  child: Editor(
                    label: 'Setor',
                    controller: usuarioController.setorTextController,
                    validator: RequiredValidator(
                        errorText: "Por favor, informe o Setor do usuário"),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Editor(
              label: 'Senha',
              controller: usuarioController.senhaTextController,
              validator:
                  RequiredValidator(errorText: "Por favor, informe a senha"),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  await usuarioController.cadastraUsuario();
                }
              },
              child: Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: AppColors.primary,
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Cadastrar',
                      style: AppTheme.captionLightBig,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
