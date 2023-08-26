import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_with_provider_firebase/app/exception/auth_exception.dart';
import 'package:todo_list_with_provider_firebase/app/repositories/user/user_repository_interface.dart';

class UserRepositoryImpl implements IUserRepository {
  FirebaseAuth _firebaseAuth;

  UserRepositoryImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<User> register(String email, String password) async {
    try {
      final userCreate = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      return userCreate.user!;
    } on FirebaseAuthException catch (e, s) {
      if (e.email == 'email-already-exists') {
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
}
