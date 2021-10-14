// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/cadastros/cadastro_controller.dart';
import 'package:inventario_site/src/modules/cadastros/widget/cadastro_menu/cadastro_menu_widget.dart';
import 'package:inventario_site/src/modules/local/cadastro_local/cadastro_local_form.dart';
import 'package:inventario_site/src/modules/patrimonio/cadastro_patrimonio/cadastro_patrimonio_form.dart';
import 'package:inventario_site/src/modules/usuario/cadastro_usuario/cadastro_usuario_form.dart';

class CadastroPage extends StatelessWidget {
  CadastroPage({Key? key}) : super(key: key);

  CadastroController cadastroController = Get.put(CadastroController());

  final pages = [
    CadastroUsuarioForm(),
    CadastroLocalForm(),
    CadastroPatrimonioForm(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 10, right: 10),
          child: CadastroMenu(
            onTap1: () {
              cadastroController.currentPage.value = 0;
            },
            onTap2: () {
              cadastroController.currentPage.value = 1;
            },
            onTap3: () {
              cadastroController.currentPage.value = 2;
            },
          ),
        ),
        const SizedBox(height: 50),
        Expanded(
          child: Obx(
            () => pages[cadastroController.currentPage.value],
          ),
        ),
      ],
    );
  }
}
