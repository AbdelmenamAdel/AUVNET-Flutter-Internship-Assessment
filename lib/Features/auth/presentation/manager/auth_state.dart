import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final bool isAuthenticated;
  final String? msg;

  const AuthState({
    required this.isLoading,
    required this.isAuthenticated,
    this.msg,
  });

  factory AuthState.initial() =>
      const AuthState(isLoading: false, isAuthenticated: false);

  AuthState copyWith({bool? isLoading, bool? isAuthenticated, String? msg}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      msg: msg,
    );
  }

  @override
  List<Object?> get props => [isLoading, isAuthenticated, msg];
}
