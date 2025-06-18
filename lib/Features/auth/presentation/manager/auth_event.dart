import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}

class AuthSignUpRequested extends AuthEvent {
  final String email;
  final String password;
  final String fullName;

  AuthSignUpRequested(this.email, this.password, this.fullName);

  @override
  List<Object?> get props => [email, password];
}

class AuthLogoutRequested extends AuthEvent {}
