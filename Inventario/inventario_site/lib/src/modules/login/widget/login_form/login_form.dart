import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventario_site/shared/widgets/editor/editor.dart';
import 'package:shared/constantes/app_images.dart';
import 'package:shared/constantes/app_text.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 500,
      child: Center(
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              child: SvgPicture.asset('assets/logoif_60.svg'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'BEM VINDO',
              style: GoogleFonts.robotoMono(
                fontSize: 50,
                fontWeight: FontWeight.w800,
                color: Colors.grey[700],
              ),
            ),
            Editor(
              label: 'Usuário',
              
            )
          ],
        ),
      ),
    );
  }
}
