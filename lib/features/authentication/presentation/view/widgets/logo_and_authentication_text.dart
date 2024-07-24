import 'package:flutter/material.dart';

import '../../../../../core/styles/app_styles.dart';

class LogoAndAuthenticationText extends StatelessWidget {
  const LogoAndAuthenticationText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset('assets/images_png/logo.png'),
      Text(text,
          style: AppStyles.font26Bold
              .copyWith(color: Theme.of(context).colorScheme.onSecondary))
    ]);
  }
}
