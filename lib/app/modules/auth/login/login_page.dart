import 'package:flutter/material.dart';
import 'package:todo_list_with_provider_firebase/app/core/widget/todo_list_field.dart';
import 'package:todo_list_with_provider_firebase/app/core/widget/todo_list_logo.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 5),
                    const TodoListLogo(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20),
                      child: Form(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TodoListField(
                              label: 'Nome',
                            ),
                            const SizedBox(height: 20),
                            TodoListField(
                              label: 'E-mail',
                              obscureText: true,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text('Esqueceu sua senha?'),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(10.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: const Text('Login'),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffF0F3F7),
                          border: Border(
                            top: BorderSide(
                              width: 5,
                              color: Colors.grey.withAlpha(50),
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 10),
                            SignInButton(
                              text: 'Continue com Google',
                              padding: const EdgeInsets.all(5.0),
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide.none,
                              ),
                              Buttons.google,
                              onPressed: () {},
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text('Não tem conta?'),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed('/register');
                                  },
                                  child: const Text('Cadastra-se'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
