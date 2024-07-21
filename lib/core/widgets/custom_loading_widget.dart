import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: Lottie.network(
        'https://lottie.host/7ce4a7a1-0315-42f6-96dd-c7c8b6c0a3cb/0s7JHfCoCA.json',
        animate: true,
        height: 200,
        width: 200,
      ),
      inAsyncCall: true,
      opacity: 0,
      child: const SizedBox(),
    );
  }
}
