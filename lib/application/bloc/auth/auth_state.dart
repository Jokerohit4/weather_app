import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadInProgress extends AuthState {}

class AuthLoadSuccess extends AuthState {
  final User user;

  AuthLoadSuccess({required this.user});
}

class AuthLoadFailure extends AuthState {}

class AuthSignedOut extends AuthState {}
