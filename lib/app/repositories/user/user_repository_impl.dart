import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:todo_list_with_provider_firebase/app/exception/auth_exception.dart';
import 'package:todo_list_with_provider_firebase/app/repositories/user/user_repository_interface.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  @override
  Future<void> forgotPassword(String email) async {
    try {
      var loginMethods = await _firebaseAuth.fetchSignInMethodsForEmail(email);

      if (loginMethods.contains('password')) {
        _firebaseAuth.sendPasswordResetEmail(email: email);
      } else if (loginMethods.contains('google')) {
        throw AuthException(
            message:
                'Não é possível recuperar senha do Google. Acesse sua conta Google para trocar de senha.');
      } else {
        throw AuthException(message: 'E-mail não cadastrado');
      }
    } on PlatformException {
      throw AuthException(message: 'Erro ao resetar senha');
    }
  }

  @override
  Future<User?> googleSignIn(String email) async {
    List<String>? loginMethods;
    try {
      final googleSignIn = GoogleSignIn();
      final googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        loginMethods =
            await _firebaseAuth.fetchSignInMethodsForEmail(googleUser.email);

        if (loginMethods.contains('password')) {
          throw AuthException(
              message:
                  'O metodo de login no Todo List para este e-mail é atráves de senha e usuário, caso tenha esquecido senha, clique em Esqueceu Senha.');
        } else {
          var googleAuth = await googleUser.authentication;
          var firebaseCredential = GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          );

          var credentials =
              await _firebaseAuth.signInWithCredential(firebaseCredential);
          return credentials.user;
        }
      } else {
        throw AuthException(
            message:
                'Por favor escolha alguma conta ou faça login com senha e usuário.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-crendential') {
        throw AuthException(message: '''
          Login inválido, você se registrou no Todo List com seguintes provedores:
          ${loginMethods?.join(',')}
          ''');
      } else {
        throw AuthException(message: 'Algo deu errado');
      }
    }
  }

  @override
  Future<void> googleSignOut(String email) async {
    await GoogleSignIn().signOut();
    await _firebaseAuth.signOut();
  }
}
