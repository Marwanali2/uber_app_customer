import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_app_customer/core/theming/colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      this.label,
      this.hintText,
      this.onFieldSubmitted,
      this.controller,
      this.keyboardType,
      this.validator,
      });
  String? label;
  String? hintText;
  Function(String)? onFieldSubmitted;
  TextEditingController? controller;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: AppColorStyles.semiBlue),
        ), //
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColorStyles.semiBlue),
        ),

        label: Text(
          "$label",
          style: const TextStyle(color: Colors.white),
        ),
        hintText: "$hintText",
        hintStyle: const TextStyle(color: Colors.white),
      ),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
