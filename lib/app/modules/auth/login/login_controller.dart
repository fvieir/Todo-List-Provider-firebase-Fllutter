import 'package:todo_list_with_provider_firebase/app/exception/auth_exception.dart';
import 'package:todo_list_with_provider_firebase/app/notifier/default_change_notifier.dart';
import 'package:todo_list_with_provider_firebase/app/services/user/user_services_interface.dart';

class LoginController extends DefaultChangeNotifier {
  final IUserServices _userServices;

  LoginController({required IUserServices userServices})
      : _userServices = userServices;

  Future<void> login(String email, String password) async {
    try {
      showLoadingAndResetState();
      notifyListeners();
      var user = await _userServices.login(email, password);

      if (user != null) {
        success();
      } else {
        setError('Usuário ou senha inválidos');
      }
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
