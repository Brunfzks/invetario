import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/constantes/app_color.dart';

class AppText {
  static var title = GoogleFonts.workSans(
    fontSize: 50,
    letterSpacing: 0.41,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );
  static var editorText = GoogleFonts.workSans(
    fontSize: 12,
    letterSpacing: 0.41,
    fontWeight: FontWeight.normal,
    color: AppColors.textColor,
  );
  static var buttonText = GoogleFonts.workSans(
    fontSize: 20,
    letterSpacing: 0.41,
    fontWeight: FontWeight.normal,
    color: AppColors.secondary,
  );
  static var buttonTextMobile = GoogleFonts.workSans(
    fontSize: 18,
    letterSpacing: 0.41,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );
  static var errorText = GoogleFonts.workSans(
    fontSize: 12,
    letterSpacing: 0.41,
    fontWeight: FontWeight.normal,
    color: AppColors.errorColor,
  );
}
