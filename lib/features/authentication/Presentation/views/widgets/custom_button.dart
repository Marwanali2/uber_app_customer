import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_app_customer/core/theming/colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, this.text, this.onPressed});
  String? text;
  VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.white),
          minimumSize: WidgetStateProperty.all(const Size(double.infinity, 50)),
          padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
              side: const BorderSide(color: AppColorStyles.semiBlue),
              borderRadius: BorderRadius.circular(10)))),
      onPressed: onPressed,
      child: Text(
        "$text",
        style: TextStyle(color: AppColorStyles.semiBlue, fontSize: 18.sp),
      ),
    );
  }
}
