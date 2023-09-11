import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_with_provider_firebase/app/repositories/user/user_repository_interface.dart';
import 'package:todo_list_with_provider_firebase/app/services/user/user_services_interface.dart';
import 'package:todo_list_with_provider_firebase/app/exception/auth_exception.dart';

class UserServicesImpl implements IUserServices {
  IUserRepository _userRepository;

  UserServicesImpl({required IUserRepository userRepository})
      : _userRepository = userRepository;

  @override
  Future<User?> register(String email, String password) async {
    try {
      return await _userRepository.register(email, password);
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    }
  }

  @override
  Future<User?> login(String email, String password) async {
    try {
      var user = await _userRepository.login(email, password);
      return user;
    } on AuthException catch (e) {
      throw AuthException(message: e.message);
    }
  }

  @override
  Future<void> forgotPassword(String email) async {
    await _userRepository.forgotPassword(email);
    try {} on AuthException catch (e) {
      throw AuthException(message: e.message);
    }
  }
}
