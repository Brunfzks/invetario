import 'package:flutter/material.dart';
import 'package:shared/constantes/app_theme.dart';
import 'package:shared/shared.dart';

class CardNotificacao extends StatelessWidget {
  ModelNotificacao modelNotificacao;

  CardNotificacao({required this.modelNotificacao, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 16,
          ),
          child: Text(
            modelNotificacao.dsPatrimonio,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: 0.27,
              color: AppTheme.darkerText,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, bottom: 8, top: 8),
          child: Text(
            modelPatrimonio.dsLocal,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              letterSpacing: 0.27,
              color: AppTheme.grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, bottom: 8),
          child: Text(
            'atual: Laboratorio 05',
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 12,
              letterSpacing: 0.27,
              color: AppTheme.grey,
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16, bottom: 8),
              child: Text(
                'Origem: Anfiteatro',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 12,
                  letterSpacing: 0.27,
                  color: AppTheme.grey,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(
                  Icons.qr_code,
                  color: Color(0xff4ea53d),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
