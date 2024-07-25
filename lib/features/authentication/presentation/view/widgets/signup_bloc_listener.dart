import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:uber_app_customer/core/methods/app_notifier.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/loading_indicator.dart';
import '../../controller/signup_cubit/sign_up_cubit.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is Failure) {
            Navigator.pop(context);
            appNotifier(context, CustomSnackBar.error(message: state.message));
          } else if (state is Success) {
            GoRouter.of(context).pop();
            appNotifier(
                context,
                const CustomSnackBar.info(
                    message:
                        'Please verify your email, a link has been sent to your email, then login'));
          } else if (state is Loading) {
            showDialog(
                context: context,
                builder: (context) => const LoadingIndicator(
                      text: 'Creating Account ....',
                    ));
          }
        },
        child: const SizedBox.shrink());
  }
}
