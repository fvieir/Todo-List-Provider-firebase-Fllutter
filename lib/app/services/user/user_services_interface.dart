import 'package:firebase_auth/firebase_auth.dart';

abstract class IUserServices {
  Future<User> register(String email, String password);
}
