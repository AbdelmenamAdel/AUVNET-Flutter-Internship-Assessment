import 'package:auvnet_internship_task/Features/auth/presentation/manager/auth_bloc.dart';
import 'package:auvnet_internship_task/Features/auth/presentation/manager/auth_state.dart';
import 'package:auvnet_internship_task/Features/main/main_view.dart';
import 'package:auvnet_internship_task/core/database/local/cache_helper.dart';
import 'package:auvnet_internship_task/core/widgets/custom_snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                  ? state.msg ?? 'Log In Successfully'
                  : 'Log In Failed',
              isError: !state.isAuthenticated,
            );
            if (state.isAuthenticated) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MainView()),
              );
              CacheHelper.sharedPreferences.setBool("isAuthenticated", true);
            }
          }
        },

        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: LoginForm(),
            ),
          );
        },
      ),
    );
  }
}
