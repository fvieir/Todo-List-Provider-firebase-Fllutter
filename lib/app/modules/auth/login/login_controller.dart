import 'package:todo_list_with_provider_firebase/app/exception/auth_exception.dart';
import 'package:todo_list_with_provider_firebase/app/notifier/default_change_notifier.dart';
import 'package:todo_list_with_provider_firebase/app/services/user/user_services_interface.dart';

class LoginController extends DefaultChangeNotifier {
  final IUserServices _userServices;
  String? infoMessage;

  LoginController({required IUserServices userServices})
      : _userServices = userServices;

  bool get hasInfo => infoMessage != null;

  Future<void> login(String email, String password) async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
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

  Future<void> forgotPassword(String email) async {
    try {
      showLoadingAndResetState();
      infoMessage = null;
      notifyListeners();
      await _userServices.forgotPassword(email);
      infoMessage = 'Reset de senha enviado para e-mail';
    } on AuthException catch (e) {
      setError(e.message);
    } finally {
      hideLoading();
      notifyListeners();
    }
  }
}
