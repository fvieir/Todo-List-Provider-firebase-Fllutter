import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_list_with_provider_firebase/app/repositories/user/user_repository_impl.dart';
import 'package:todo_list_with_provider_firebase/app/services/user/user_services_interface.dart';

class UserServicesImpl implements IUserServices {
  UserRepositoryImpl _userRepository;

  UserServicesImpl({required UserRepositoryImpl userRepository})
      : _userRepository = userRepository;

  @override
  Future<User> register(String email, String password) =>
      _userRepository.register(email, password);
}
