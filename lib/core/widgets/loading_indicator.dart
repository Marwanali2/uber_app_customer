import 'package:flutter/material.dart';
import 'package:uber_app_customer/core/helpers/app_spaces.dart';

import '../styles/app_styles.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Theme.of(context).colorScheme.onSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(children: [
                horizontalSpace(5),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.onSecondary),
                ),
                horizontalSpace(8),
                Text(text,
                    style: AppStyles.font16Regular.copyWith(
                        color: Theme.of(context).colorScheme.secondary))
              ])),
        ));
  }
}
