import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app/application/bloc/auth/auth_event.dart';
import 'package:weather_app/application/bloc/auth/auth_state.dart';
import 'package:weather_app/domain/repositories/auth_repository.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  StreamSubscription<User?>? _userSubscription;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    _userSubscription = authRepository.authStateChanges().listen((User? user) {
      if (user != null) {
        add(AuthUserChanged(user));
      } else {
        add(AuthLoggedOut());
      }
    });

    on<AuthRequested>(_onAuthRequested);
    on<AuthSignOutRequested>(_onAuthSignOutRequested);
    on<AuthUserChanged>(_onAuthUserChanged);
    on<AuthLoggedOut>(_onAuthLoggedOut);
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }

  void _onAuthRequested(AuthRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoadInProgress());
    try {
      await authRepository.signInWithEmailPassword(event.email, event.password);
    } catch (_) {
      emit(AuthLoadFailure());
    }
  }

  void _onAuthSignOutRequested(AuthSignOutRequested event, Emitter<AuthState> emit) async {
    await authRepository.signOut();
    emit(AuthSignedOut());
  }

  void _onAuthUserChanged(AuthUserChanged event, Emitter<AuthState> emit) {
    emit(AuthLoadSuccess(user: event.user));
  }

  void _onAuthLoggedOut(AuthLoggedOut event, Emitter<AuthState> emit) {
    emit(AuthSignedOut());
  }
}

