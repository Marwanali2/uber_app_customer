import 'package:flutter/material.dart';

class CustomAppTextFormField extends StatelessWidget {
  const CustomAppTextFormField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.obscureText,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.prefixIcon,
    this.keyboardType,
    this.controller,
    this.validator,
  });
  final String hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final InputBorder? border, enabledBorder, focusedBorder;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        border: border ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.onSecondary),
            ),
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.onSecondary),
            ),
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.onSecondary),
            ),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon ?? const SizedBox.shrink(),
      ),
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      obscureText: obscureText ?? false,
    );
  }
}
