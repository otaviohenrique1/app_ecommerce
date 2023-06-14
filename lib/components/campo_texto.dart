import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoTexto extends StatelessWidget {
  const CampoTexto({
    super.key,
    required this.exibeLabel,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.label,
    this.validator,
    this.keyboardType,
    this.initialValue,
    this.maxLines,
    this.inputFormatters,
  });

  final bool exibeLabel;
  final String? label;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: exibeLabel,
          child: Container(
            margin: const EdgeInsets.only(bottom: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                (label == null) ? "" : label!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          maxLines: (maxLines == null) ? 1 : maxLines,
          obscureText: obscureText,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            errorStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
