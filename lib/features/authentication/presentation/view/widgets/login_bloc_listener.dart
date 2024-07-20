import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:uber_app_customer/core/methods/app_notifier.dart';
import 'package:uber_app_customer/features/authentication/presentation/controller/cubit/login_cubit.dart';
import 'package:uber_app_customer/features/home/presentation/view/home_scree.dart';

import '../../../../../core/widgets/loading_indicator.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is Failure) {
            Navigator.pop(context);
            appNotifier(context, CustomSnackBar.error(message: state.message));
          } else if (state is Success) {
            Navigator.pop(context);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScree()));
          } else if (state is Loading) {
            showDialog(
                context: context,
                builder: (context) => const LoadingIndicator(
                      text: 'Logging In ....',
                    ));
          }
        },
        child: const SizedBox.shrink());
  }
}
