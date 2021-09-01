import 'package:flutter/material.dart';
import 'package:shared/constantes/app_images.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 500,
      child: Column(
        children: [
          Center(
            child: Container(width: 60, height: 60, child: AppImages.logoIf),
          )
        ],
      ),
    );
  }
}
