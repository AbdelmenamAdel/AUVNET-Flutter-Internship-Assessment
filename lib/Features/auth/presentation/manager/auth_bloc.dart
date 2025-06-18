import 'dart:developer';

import 'package:auvnet_internship_task/Features/auth/data/repositories/auth_repository.dart';
import 'package:auvnet_internship_task/core/database/local/cache_helper.dart';
import 'package:auvnet_internship_task/core/database/remote/supabase_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthState.initial()) {
    on<AuthLoginRequested>(_onLogin);
    on<AuthSignUpRequested>(_onSignUp);
    on<AuthLogoutRequested>(_onLogout);
  }
  late Map<String, dynamic> userInfo;
  Future<void> _onLogin(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      var response = await authRepository.login(event.email, event.password);

      if (response.user == null) {
        emit(
          state.copyWith(
            isLoading: false,
            msg: 'Please check your email and password or sign up first',
          ),
        );
        return;
      }

      final userInfo = await SupabaseConfig.client
          .from('users')
          .select()
          .eq('id', response.user!.id)
          .maybeSingle();

      if (userInfo == null) {
        emit(
          state.copyWith(
            isLoading: false,
            msg: 'User data not found in the database.',
          ),
        );
        return;
      }

      log("userInfo: $userInfo");
      emit(state.copyWith(isLoading: false, isAuthenticated: true));
    } catch (e) {
      log("Login error: $e");
      emit(state.copyWith(isLoading: false, msg: e.toString()));
    }
  }

  Future<void> _onSignUp(
    AuthSignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    try {
      var response = await authRepository.signUp(event.email, event.password);

      if (response.user != null) {
        final existingUser = await SupabaseConfig.client
            .from('users')
            .select()
            .eq('id', response.user!.id)
            .maybeSingle();

        if (existingUser == null) {
          await SupabaseConfig.client.from('users').insert({
            'id': response.user!.id,
            'email': response.user!.email,
            'full_name': event.fullName,
            'is_authenticated': response.user!.emailConfirmedAt != null,
          });

          emit(
            state.copyWith(
              isLoading: false,
              isAuthenticated: true,
              msg: 'Check your email to confirm your account',
            ),
          );
        } else {
          emit(
            state.copyWith(
              isLoading: false,
              isAuthenticated: false,
              msg: 'This user is already registered, please log in',
            ),
          );
        }
      }
    } catch (e) {
      log("Sign Up error: $e");
      emit(state.copyWith(isLoading: false, msg: e.toString()));
    }
  }

  Future<void> _onLogout(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await authRepository.logout();
    CacheHelper.sharedPreferences.setBool("onboarding", false);
    CacheHelper.sharedPreferences.setBool("isAuthenticated", false);
    log(
      "User logged  ${CacheHelper.sharedPreferences.getBool("isAuthenticated")}",
    );
    log(
      "User logged out ${CacheHelper.sharedPreferences.getBool("onboarding")}",
    );
    emit(state.copyWith(isAuthenticated: false));
  }
}
