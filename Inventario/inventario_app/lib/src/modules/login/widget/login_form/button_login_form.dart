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
              const Color(0xFF4EB87A),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: AppText.buttonTextMobile,
              ),
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.fingerprint,
                color: Colors.white60,
              )
            ],
          ),
        ),
      ),
    );
  }
}
