import 'package:auvnet_internship_task/Features/auth/presentation/manager/auth_bloc.dart';
import 'package:auvnet_internship_task/Features/auth/presentation/manager/auth_state.dart';
import 'package:auvnet_internship_task/core/widgets/custom_snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_view.dart';
import 'widgets/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isLoading) {
            CustomSnackBar.show(context, 'Loading...');
            return;
          } else {
            CustomSnackBar.show(
              context,
              state.isAuthenticated
                  ? state.msg ?? 'Sign Up Successfully'
                  : 'Sign Up Failed',
              isError: !state.isAuthenticated,
            );
            if (state.isAuthenticated) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()),
              );
            }
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SignUpForm(),
            ),
          );
        },
      ),
    );
  }
}
