import 'package:firebase_auth/firebase_auth.dart';

abstract class IUserRepository {
  Future<User?> register(String email, String password);
  Future<User?> login(String email, String password);
  Future<void> forgotPassword(String email);
  Future<User?> googleSignIn(String email);
  Future<void> signOut();
}
