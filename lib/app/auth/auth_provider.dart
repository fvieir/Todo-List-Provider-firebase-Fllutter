import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_with_provider_firebase/app/core/navigator/todo_list_navigator.dart';
import 'package:todo_list_with_provider_firebase/app/services/user/user_services_interface.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  final IUserServices _userServices;

  AuthProvider({
    required FirebaseAuth firebaseAuth,
    required IUserServices userServices,
  })  : _firebaseAuth = firebaseAuth,
        _userServices = userServices;

  Future<void> logout() => _userServices.signOut();
  User? get user => _firebaseAuth.currentUser;

  void loadListerners() {
    _firebaseAuth.userChanges().listen((_) => notifyListeners());
    _firebaseAuth.idTokenChanges().listen((u) {
      if (u != null) {
        TodoListNavigator.to.pushNamedAndRemoveUntil('/home', (route) => false);
      } else {
        TodoListNavigator.to
            .pushNamedAndRemoveUntil('/login', (route) => false);
      }
    });
  }
}
