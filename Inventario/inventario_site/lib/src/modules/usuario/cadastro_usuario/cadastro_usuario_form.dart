// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:inventario_site/shared/widgets/editor/editor.dart';
import 'package:inventario_site/src/modules/usuario/usuario_controller.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_theme.dart';

class CadastroUsuarioForm extends StatelessWidget {
  CadastroUsuarioForm({Key? key}) : super(key: key);

  UsuarioController usuarioController = Get.find();
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
                    try {
                      if (!await usuarioController.existeUsuario(
                          usuarioController.prontuarioTextController.text)) {
                        await usuarioController.cadastraUsuario();
                        usuarioController.homeController.showAlert(
                            colors: AppColors.primary,
                            icon: Icons.done_all,
                            textAlert: 'Usuário cadastrado com sucesso!');
                        usuarioController.limpaControllers();
                      } else {
                        usuarioController.homeController.showAlert(
                            colors: AppColors.avisorColor,
                            icon: Icons.warning,
                            textAlert:
                                'Já existe um usuário cadastrado com esse prontuario!');
                      }
                    } catch (e) {
                      usuarioController.homeController.showAlert(
                          colors: AppColors.errorColor!,
                          icon: Icons.warning,
                          textAlert:
                              'Erro ao Cadastrar o usuário, por favor, tente novamente!');
                    }
                  }
                },
                child: Obx(
                  () => Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      color: AppColors.primary,
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: usuarioController.isLoading.value
                            ? Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.secondary,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'Cadastrar',
                                style: AppTheme.captionLightBig,
                              ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
