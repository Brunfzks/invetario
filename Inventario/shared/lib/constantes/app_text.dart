import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_theme.dart';

class AppText {
  static var title = GoogleFonts.workSans(
    fontSize: 50,
    letterSpacing: 0.41,
    fontWeight: FontWeight.w600,
    color: Colors.grey[700],
  );
  static var editorText = GoogleFonts.workSans(
    fontSize: 12,
    letterSpacing: 0.41,
    fontWeight: FontWeight.normal,
    color: Colors.grey[700],
  );
  static var buttonText = GoogleFonts.workSans(
    fontSize: 20,
    letterSpacing: 0.41,
    fontWeight: FontWeight.normal,
    color: AppColors.secondary,
  );
  static var errorText = GoogleFonts.workSans(
    fontSize: 12,
    letterSpacing: 0.41,
    fontWeight: FontWeight.normal,
    color: AppColors.errorColor,
  );
  static var labelText = GoogleFonts.workSans(
      fontSize: 16,
      letterSpacing: 0.41,
      fontWeight: FontWeight.normal,
      color: AppColors.secondary);
  static var labelSelected = GoogleFonts.workSans(
      fontSize: 16,
      letterSpacing: 0.41,
      fontWeight: FontWeight.normal,
      color: AppTheme.darkText);
}
