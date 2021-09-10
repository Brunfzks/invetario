import 'package:flutter/material.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';

class ButtonForm extends StatelessWidget {
  const ButtonForm({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            'Login',
            style: AppText.buttonTextMobile,
          ),
        ),
      ),
    );
  }
}
