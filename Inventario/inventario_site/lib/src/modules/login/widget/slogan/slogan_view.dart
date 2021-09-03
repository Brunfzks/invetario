import 'package:flutter/material.dart';
import 'package:shared/constantes/app_theme.dart';

class Slogan extends StatelessWidget {
  const Slogan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Text(
          '"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque lacinia ac lacus eget sempre. Phasellus lobortis maximus risus, id scelerisque."',
          style: AppTheme.title,
        ),
      ),
    );
  }
}
