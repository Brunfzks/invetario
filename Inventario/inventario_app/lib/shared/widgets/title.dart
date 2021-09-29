import 'package:flutter/material.dart';
import 'package:shared/constantes/app_text.dart';

class TitlePage extends StatelessWidget {
  TitlePage(
      {required this.primaryText,
      required this.secondText,
      required this.subTitle,
      this.padding = true,
      Key? key})
      : super(key: key);

  String primaryText, secondText, subTitle;
  bool padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding ? 20 : 0, top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                primaryText,
                textAlign: TextAlign.left,
                style: AppText.textSecondTitleHome,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                secondText,
                textAlign: TextAlign.center,
                style: AppText.textTitleHome,
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            subTitle,
            textAlign: TextAlign.start,
            style: AppText.textSubTitleHome,
          ),
        ],
      ),
    );
  }
}
