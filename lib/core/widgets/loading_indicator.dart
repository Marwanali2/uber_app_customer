import 'package:flutter/material.dart';
import 'package:uber_app_customer/core/helpers/app_spaces.dart';

import '../styles/app_styles.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          margin: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(children: [
                horizontalSpace(5),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
                horizontalSpace(8),
                Text(text, style: AppStyles.font16Regular)
              ])),
        ));
  }
}
