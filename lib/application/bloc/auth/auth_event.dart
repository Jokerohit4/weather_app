import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthEvent {}

class AuthRequested extends AuthEvent {
  final String email;
  final String password;

  AuthRequested({required this.email, required this.password});
}

class AuthSignOutRequested extends AuthEvent {}

class AuthUserChanged extends AuthEvent {
  final User user;

  AuthUserChanged(this.user);
}

class AuthLoggedOut extends AuthEvent {}
