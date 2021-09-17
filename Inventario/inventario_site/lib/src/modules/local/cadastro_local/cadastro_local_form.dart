// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:inventario_site/shared/widgets/editor/editor.dart';
import 'package:inventario_site/src/modules/local/local_controller.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_theme.dart';
import 'package:shared/shared.dart';

class CadastroLocalForm extends StatelessWidget {
  CadastroLocalForm({Key? key}) : super(key: key);

  LocalController localController = Get.find();
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
              controller: localController.descricaoTextController,
              validator:
                  RequiredValidator(errorText: "Por favor, o nome da sala"),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 600,
                child: Obx(
                  () => DropdownButton<ModelUsuario>(
                    value: localController.homeController
                        .listUsuario[localController.selectedUsuario.value],
                    items: localController.homeController.listUsuario
                        .map((ModelUsuario usuario) {
                      return DropdownMenuItem<ModelUsuario>(
                        value: usuario,
                        child: Text(usuario.nmUsuario),
                      );
                    }).toList(),
                    onChanged: (usuario) {
                      localController.selectedUsuario.value = localController
                          .homeController.listUsuario
                          .indexOf(usuario);
                    },
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    await localController.cadastraLocal();
                    localController.homeController.showAlert(
                        colors: AppColors.primary,
                        icon: Icons.done_all,
                        textAlert: 'Local cadastrado com sucesso!');
                    localController.limpaControllers();
                  } catch (e) {
                    localController.homeController.showAlert(
                        colors: AppColors.avisorColor,
                        icon: Icons.warning,
                        textAlert:
                            'Erro ao Cadastrar o local, por favor, tente novamente!');
                  }
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
