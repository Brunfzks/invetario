import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/cadastros/cadastro_controller.dart';
import 'package:inventario_site/src/modules/cadastros/widget/cadastro_menu/widget/cadastro_card/cadastro_card.dart';
import 'package:shared/constantes/app_theme.dart';

class CadastroMenu extends StatelessWidget {
  CadastroMenu({
    Key? key,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
  }) : super(key: key);

  final CadastroController cadastroController = Get.find();

  final VoidCallback onTap1;
  final VoidCallback onTap2;
  final VoidCallback onTap3;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: CadastroCard(
              indexMenu: 0,
              icon: Icons.person,
              label: 'Usuário',
              onTap: onTap1,
            ),
          ),
          Expanded(
            child: CadastroCard(
              indexMenu: 1,
              icon: Icons.home,
              label: 'Local',
              onTap: onTap2,
            ),
          ),
          Expanded(
            child: CadastroCard(
              indexMenu: 2,
              icon: Icons.chair,
              label: 'Patrimonio',
              onTap: onTap3,
            ),
          ),
        ],
      ),
    );
  }
}
