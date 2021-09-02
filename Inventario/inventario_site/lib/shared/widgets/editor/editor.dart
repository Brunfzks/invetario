import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Editor extends StatelessWidget {
  Editor({
    Key? key,
    required this.label,
    this.hint,
    required this.controller,
    this.enabled,
    this.isNumber,
    this.onSubmitted,
    this.isMultiline,
  }) : super(key: key);

  final String label;
  final String? hint;
  final TextEditingController controller;
  final Function(String)? onSubmitted;
  bool? enabled = true, isNumber = false, isMultiline = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          keyboardType: isMultiline == true
              ? TextInputType.multiline
              : TextInputType.text,
          maxLines: isMultiline == true ? 10 : 1,
          onSubmitted: onSubmitted,
          inputFormatters: isNumber == true
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
                ]
              : null,
          enabled: enabled,
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            labelText: label,
            hintText: hint ?? '',
          ),
        ),
      ),
    );
  }
}
