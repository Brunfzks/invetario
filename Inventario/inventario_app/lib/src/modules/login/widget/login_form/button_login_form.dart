import 'package:flutter/material.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';

class ButtonForm extends StatelessWidget {
  const ButtonForm({Key? key, required this.onTap}) : super(key: key);
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 80,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
        gradient: LinearGradient(
            colors: [
              AppColors.primary,
              Color(0xFF4EB87A),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
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
