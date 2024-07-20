import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

appNotifier(BuildContext context, CustomSnackBar message) {
  showTopSnackBar(
    Overlay.of(context),
    message,
  );
}
