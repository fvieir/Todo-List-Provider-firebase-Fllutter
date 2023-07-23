import 'package:provider/provider.dart';
import 'package:todo_list_with_provider_firebase/app/core/modules/todo_list_modules.dart';
import 'package:todo_list_with_provider_firebase/app/modules/auth/login/login_controller.dart';
import 'package:todo_list_with_provider_firebase/app/modules/auth/login/login_page.dart';

class AuthModule extends TodoListModules {
  AuthModule()
      : super(
          bindings: [
            ChangeNotifierProvider(
              create: (context) => LoginController(),
            ),
          ],
          routes: {
            '/login': (context) => const LoginPage(),
          },
        );
}
