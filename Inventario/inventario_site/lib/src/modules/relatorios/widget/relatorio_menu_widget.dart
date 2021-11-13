import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_site/src/modules/cadastros/widget/cadastro_menu/cadastro_card.dart';
import 'package:inventario_site/src/modules/relatorios/relatorio_controller.dart';
import 'package:inventario_site/src/modules/relatorios/widget/relatorio_card.dart';

class RelatorioMenu extends StatelessWidget {
  RelatorioMenu({
    Key? key,
    required this.onTap1,
    required this.onTap2,
    required this.onTap3,
    required this.onTap4,
  }) : super(key: key);

  final RelatorioController cadastroController = Get.find();

  final VoidCallback onTap1;
  final VoidCallback onTap2;
  final VoidCallback onTap3;
  final VoidCallback onTap4;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 600,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: CardRelatorioMenu(
              indexMenu: 0,
              label: 'Não Localizados',
              onTap: onTap1,
            ),
          ),
          Expanded(
            child: CardRelatorioMenu(
              indexMenu: 1,
              label: 'Identificação Local',
              onTap: onTap2,
            ),
          ),
          Expanded(
            child: CardRelatorioMenu(
              indexMenu: 2,
              label: 'Ociosos',
              onTap: onTap3,
            ),
          ),
          Expanded(
            child: CardRelatorioMenu(
              indexMenu: 3,
              label: 'Inserviveis',
              onTap: onTap4,
            ),
          ),
          
        ],
      ),
    );
  }
}
