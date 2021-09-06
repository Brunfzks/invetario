import 'package:flutter/material.dart';
import 'package:inventario_app/src/modules/home/home_view.dart';
import 'package:shared/constantes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      home: HomePage(),
    );
  }
}
