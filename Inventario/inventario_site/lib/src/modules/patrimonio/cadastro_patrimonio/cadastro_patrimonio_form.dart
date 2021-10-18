// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:inventario_site/shared/widgets/editor/editor.dart';
import 'package:inventario_site/src/modules/patrimonio/patrimonio_controller.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_theme.dart';
import 'package:shared/shared.dart';

class CadastroPatrimonioForm extends StatelessWidget {
  CadastroPatrimonioForm({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  PatrimonioController patrimonioController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                children: [Expanded(
                child: Editor(
                  label: 'Ed',
                  controller: patrimonioController.dsEdTextController,
                  isNumber: true,
                  validator: RequiredValidator(
                    errorText: "Por favor, informe o Ed",
                  ),
                ),
              ),
              Expanded(
                child: Editor(
                  label: 'Rótulo',
                  controller: patrimonioController.dsRotuloTextController,
                  validator: RequiredValidator(
                    errorText: "Por favor, informe o Rótulo",
                  ),
                ),
              ),],),             
              Row(
                children: [
                  Expanded(
                    child: Editor(
                      label: 'Campus',
                      controller: patrimonioController.dsCampusTextController,
                      validator: RequiredValidator(
                        errorText: "Por favor, informe o Campus",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Editor(
                      label: 'Valor',
                      controller:
                          patrimonioController.vlPatrimonioTextController,
                      validator: RequiredValidator(
                        errorText: "Por favor, informe o valor do patrimonio",
                      ),
                      isNumber: true,
                    ),
                  ),
                  Expanded(
                    child: Editor(
                      label: 'Número do Patrimonio',
                      controller:
                          patrimonioController.nmPatrimonioTextController,
                      validator: RequiredValidator(
                        errorText: "Por favor, informe o número do patrimonio",
                      ),
                      isNumber: true,
                    ),
                  ),
                  Expanded(
                    child: Editor(
                      label: 'Estado de Conservação',
                      controller:
                          patrimonioController.stConservacaoTextController,
                      validator: RequiredValidator(
                        errorText: "Por favor, informe o estado de conservação",
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Editor(
                      label: 'Número Nota Fiscal',
                      controller:
                          patrimonioController.nmNotaFiscaTextController,
                      validator: RequiredValidator(
                        errorText: "Por favor, informe o número da nota Fiscal",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Editor(
                      label: 'Número de Série',
                      controller: patrimonioController.nmSerieTextController,
                      validator: RequiredValidator(
                        errorText: "Por favor, informe o número de série",
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Editor(
                      label: 'Nome Fornecedor',
                      controller:
                          patrimonioController.nmFornecedorTextController,
                      validator: RequiredValidator(
                        errorText: "Por favor, informe o nome do fornecedor",
                      ),
                    ),
                  ),
                  Expanded(
                    child: Editor(
                      label: 'Marca',
                      controller: patrimonioController.dsMarcaTextController,
                      validator: RequiredValidator(
                        errorText: "Por favor, informe o nome da Marca",
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Editor(
                      label: 'Empenho',
                      controller: patrimonioController.empenhoTextController,
                      validator: RequiredValidator(
                        errorText: "Por favor, informe o Empenho",
                      ),
                      isNumber: true,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Editor(
                      label: 'Tp Ingresso',
                      controller: patrimonioController.tpIngressoTextController,
                      validator: RequiredValidator(
                        errorText: "Por favor, informe o Tp Ingresso",
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 17),
                      child: Obx(
                        () => DropdownButton<ModelLocal>(
                          value: patrimonioController.homeController.listLocal[
                              patrimonioController.selectedLocal.value],
                          items: patrimonioController.homeController.listLocal
                              .map((ModelLocal local) {
                            return DropdownMenuItem<ModelLocal>(
                              value: local,
                              child: Text(local.dsLocal),
                            );
                          }).toList(),
                          onChanged: (local) {
                            patrimonioController.selectedLocal.value =
                                patrimonioController.homeController.listLocal
                                    .indexOf(local);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Editor(
                label: 'Descrição',
                controller: patrimonioController.dsPatrimonioTextController,
                validator: RequiredValidator(
                  errorText: "Por favor, informe a descrição",
                ),
                isMultiline: true,
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await patrimonioController.cadastraParimonio();
                      patrimonioController.homeController.showAlert(
                          colors: AppColors.primary,
                          icon: Icons.done_all,
                          textAlert: 'Patrimonio cadastrado com sucesso!');
                      patrimonioController.limpaControllers();
                    } catch (e) {
                      patrimonioController.homeController.showAlert(
                          colors: AppColors.avisorColor,
                          icon: Icons.warning,
                          textAlert:
                              'Erro ao Cadastrar o Patrimonio, por favor, tente novamente!');
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
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: patrimonioController.isLoading.value
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
