// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/shared.dart';

class RelatorioCard extends StatelessWidget {
  RelatorioCard({
    Key? key,
    required this.patrimonio,
  }) : super(key: key);
  ModelPatrimonio patrimonio;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: AppColors.primary,)),
    );
  }
}
