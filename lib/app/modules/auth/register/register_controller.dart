import 'package:flutter/material.dart';
import 'package:todo_list_with_provider_firebase/app/exception/auth_exception.dart';
import 'package:todo_list_with_provider_firebase/app/services/user/user_services_interface.dart';

class RegisterController extends ChangeNotifier {
  final IUserServices _userService;

  bool success = false;
  String? error;

  RegisterController({required IUserServices userService})
      : _userService = userService;

  Future<void> registerUser(String email, String password) async {
    try {
      success = false;
      error = null;
      notifyListeners();

      final user = await _userService.register(email, password);

      if (user != null) {
        success = true;
      } else {
        error = 'Erro ao cadastrar usuário';
      }
    } on AuthException catch (e) {
      error = e.message;
    } finally {
      notifyListeners();
    }
  }
}
