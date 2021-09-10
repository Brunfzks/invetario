import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';

class Editor extends StatelessWidget {
  Editor({
    Key? key,
    required this.label,
    this.hint,
    required this.controller,
    this.enabled,
    this.isNumber,
    this.isMultiline,
    this.prefix,
    this.width,
    this.isPassword,
    this.sufix,
    required this.validator,
  }) : super(key: key);

  final String label;
  final String? hint;
  final TextEditingController controller;
  bool? enabled = true,
      isNumber = false,
      isMultiline = false,
      isPassword = false;
  final RequiredValidator validator;
  final Icon? prefix;
  final Widget? sufix;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          validator: validator,
          textAlignVertical: TextAlignVertical.center,
          style: AppText.editorTextMobile,
          keyboardType: isMultiline == true
              ? TextInputType.multiline
              : TextInputType.text,
          maxLines: isMultiline == true ? 10 : 1,
          inputFormatters: isNumber == true
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
                ]
              : null,
          enabled: enabled,
          controller: controller,
          obscureText: isPassword ?? false,
          decoration: InputDecoration(
            labelStyle: TextStyle(
              color: AppColors.textColor,
              fontSize: 14,
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF4EB87A), width: 2),
            ),
            suffix: sufix,
            fillColor: AppColors.primary,
            labelText: label,
            hintText: hint ?? '',
          ),
        ),
      ),
    );
  }
}
