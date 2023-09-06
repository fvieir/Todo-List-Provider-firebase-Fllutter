import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:todo_list_with_provider_firebase/app/exception/auth_exception.dart';
import 'package:todo_list_with_provider_firebase/app/repositories/user/user_repository_interface.dart';

class UserRepositoryImpl implements IUserRepository {
  FirebaseAuth _firebaseAuth;

  UserRepositoryImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register(String email, String password) async {
    try {
      final userCreate = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return userCreate.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        var emailTypes = await _firebaseAuth.fetchSignInMethodsForEmail(email);
        if (emailTypes.contains('email-already-exists')) {
          throw AuthException(
              message: 'E-mail já utilizado, por favor escolha outro e-mail.');
        } else {
          throw AuthException(
              message:
                  'Você se cadastrou no Todo List pelo Google, por favor utilize ele para entrar.');
        }
      } else {
        throw AuthException(message: e.message ?? 'Erro ao registrar usuário.');
      }
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      var userCredential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential.user;
    } on PlatformException catch (e) {
      throw AuthException(message: e.message ?? 'Senha ou usuário inválidos');
    } on FirebaseException catch (e) {
      if (e.code == "wrong-password") {
        throw AuthException(message: 'Senha ou usuário inválidos');
      }
      throw AuthException(message: e.message ?? 'Senha ou usuário inválidos');
    }
  }
}
