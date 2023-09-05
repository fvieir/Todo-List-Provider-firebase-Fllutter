import 'package:todo_list_with_provider_firebase/app/exception/auth_exception.dart';
import 'package:todo_list_with_provider_firebase/app/notifier/default_change_notifier.dart';
import 'package:todo_list_with_provider_firebase/app/services/user/user_services_interface.dart';

class RegisterController extends DefaultChangeNotifier {
  final IUserServices _userService;

  RegisterController({
    required IUserServices userService,
  }) : _userService = userService;

  Future<void> registerUser(String email, String password) async {
    try {
      showLoadingAndResetState();
      notifyListeners();

      final user = await _userService.register(email, password);

      if (user != null) {
        success();
      } else {
        setError('Erro ao cadastrar usuário');
      }
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
