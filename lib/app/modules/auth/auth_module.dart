import 'package:provider/provider.dart';
import 'package:todo_list_with_provider_firebase/app/core/modules/todo_list_modules.dart';
import 'package:todo_list_with_provider_firebase/app/modules/auth/login/login_controller.dart';
import 'package:todo_list_with_provider_firebase/app/modules/auth/login/login_page.dart';
import 'package:todo_list_with_provider_firebase/app/modules/auth/register/register_controller.dart';
import 'package:todo_list_with_provider_firebase/app/modules/auth/register/register_page.dart';

class AuthModule extends TodoListModules {
  AuthModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (context) => LoginController(),
            ),
            ChangeNotifierProvider(
              create: (context) =>
                  RegisterController(userService: context.read()),
            ),
          ],
          routes: {
            '/login': (context) => const LoginPage(),
            '/register': (context) => const RegisterPage(),
          },
        );
}
