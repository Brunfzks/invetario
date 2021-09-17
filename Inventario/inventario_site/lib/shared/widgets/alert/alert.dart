// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:shared/constantes/app_color.dart';

class Alert extends StatelessWidget {
  Alert({
    Key? key,
    required this.color,
    required this.icon,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        border: Border.all(width: 1, color: color),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Center(
              child: Icon(
                icon,
                color: AppColors.secondary,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 7,
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontFamily: 'WorkSans',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                letterSpacing: -0.04,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: onTap,
              child: Icon(
                Icons.close,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
