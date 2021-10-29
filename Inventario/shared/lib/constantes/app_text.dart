import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_theme.dart';

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
    color: AppColors.primary,
    
  );

  static var labelTextWhite = GoogleFonts.workSans(
    fontSize: 16,
    letterSpacing: 0.41,
    fontWeight: FontWeight.normal,
    color: AppColors.secondary,
    
  );

  static var labelSelected = GoogleFonts.workSans(
      fontSize: 16,
      letterSpacing: 0.41,
      fontWeight: FontWeight.normal,
      color: AppTheme.darkText);

  /////////////// MOBILE /////////////////

  static var textTitlePage = GoogleFonts.workSans(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.4,
    height: 0.9,
    color: AppTheme.grey,
  );

  static var errorTextMobile = GoogleFonts.workSans(
    fontSize: 12,
    letterSpacing: 0.41,
    fontWeight: FontWeight.normal,
    color: AppColors.errorColor,
  );

  static var editorTextMobile = GoogleFonts.workSans(
    fontSize: 16,
    letterSpacing: 0.41,
    fontWeight: FontWeight.w500,
    color: AppColors.darkerText,
  );

  static var buttonTextMobile = GoogleFonts.workSans(
    fontSize: 16,
    letterSpacing: 0.41,
    fontWeight: FontWeight.w500,
    color: AppColors.textColorWhite,
  );

  static var textSecondCardNotificacaoHome = GoogleFonts.workSans(
    fontWeight: FontWeight.w300,
    fontSize: 12,
    letterSpacing: 0.27,
    color: AppColors.grey,
  );

  static var textPrimaryCardNotificacaoHome = GoogleFonts.workSans(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    letterSpacing: 0.27,
    color: AppColors.grey,
  );

  static var textPrimaryCardLocalHome = GoogleFonts.workSans(
    fontWeight: FontWeight.w600,
    fontSize: 12,
    letterSpacing: 0.27,
    color: AppColors.grey,
  );

  static var textPrimaryCardLocalHomeWhite = GoogleFonts.workSans(
    fontWeight: FontWeight.w600,
    fontSize: 12,
    letterSpacing: 0.27,
    color: AppColors.textColorWhite,
  );

  static var textTitleHome = GoogleFonts.workSans(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      letterSpacing: 0.4,
      height: 0.9,
      color: AppColors.primary);

  static var textSubTitleHome = GoogleFonts.workSans(
    fontWeight: FontWeight.bold,
    fontSize: 10,
    letterSpacing: 0.4,
    height: 0.9,
    color: AppColors.textColor,
  );

  static var textSecondTitleHome = GoogleFonts.workSans(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    letterSpacing: 0.4,
    height: 0.9,
    color: AppColors.grey,
  );
}
