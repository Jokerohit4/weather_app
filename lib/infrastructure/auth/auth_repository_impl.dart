

import 'package:firebase_auth/firebase_auth.dart';
import 'package:weather_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this._firebaseAuth);

  @override
  Future<void> signInWithEmailPassword(String email, String password) async {
   UserCredential userCredential =  await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
 //  userCredential.user?.uid;
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }

}