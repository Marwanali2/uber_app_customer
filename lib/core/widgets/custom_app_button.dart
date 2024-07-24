import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uber_app_customer/core/styles/app_styles.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton(
      {super.key,
      required this.text,
      required this.height,
      this.buttonBackgroundColor,
      this.onPressed});
  final String text;
  final int height;
  final Color? buttonBackgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      minWidth: double.infinity,
      onPressed: onPressed,
      color: buttonBackgroundColor ?? Theme.of(context).colorScheme.onSecondary,
      child: Text(text,
          style: AppStyles.font20Regular.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          )),
    );
  }
}
