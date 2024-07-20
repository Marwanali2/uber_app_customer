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
  });
  final String hintText;
  final Widget? suffixIcon;
  final bool? obscureText;
  final InputBorder? border, enabledBorder, focusedBorder;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      obscureText: obscureText ?? false,
    );
  }
}
