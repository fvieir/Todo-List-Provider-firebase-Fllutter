import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_with_provider_firebase/app/core/ui/theme_extensions.dart';
import 'package:todo_list_with_provider_firebase/app/core/validator/validator.dart';
import 'package:todo_list_with_provider_firebase/app/core/widget/todo_list_field.dart';
import 'package:todo_list_with_provider_firebase/app/core/widget/todo_list_logo.dart';
import 'package:todo_list_with_provider_firebase/app/modules/auth/register/register_controller.dart';
import 'package:todo_list_with_provider_firebase/app/notifier/default_listener_notifier.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmedPasswordEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    DefaultListenerNotifier listenerNotifier = DefaultListenerNotifier(
        changeNotifier: context.read<RegisterController>());

    listenerNotifier.listener(
      context: context,
      successCallback: (notifier, listenerInstance) {
        listenerNotifier.dispose();
        Navigator.of(context).pop();
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    _confirmedPasswordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: ClipOval(
            child: Container(
              color: context.primaryColor.withAlpha(20),
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: context.primaryColor,
                size: 20,
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Todo List',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: context.primaryColor,
                fontSize: 10,
              ),
            ),
            Text(
              'Cadastro',
              style: TextStyle(
                fontFamily: 'Roboto',
                color: context.primaryColor,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.50,
            child: const FittedBox(
              fit: BoxFit.fitHeight,
              child: TodoListLogo(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 20,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TodoListField(
                    label: 'E-mail',
                    controller: _emailEC,
                    validator: Validatorless.multiple([
                      Validatorless.email('Informe um e-mail válido'),
                      Validatorless.required('E-mail é um campo obrigatório')
                    ]),
                  ),
                  const SizedBox(height: 20),
                  TodoListField(
                    controller: _passwordEC,
                    label: 'Senha',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha é um campo obrigatório'),
                      Validatorless.min(
                          6, 'Senha deve conter no mínimo 6 caracteres'),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  TodoListField(
                    controller: _confirmedPasswordEC,
                    label: 'Confirme Senha',
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha é um campo obrigatório'),
                      Validator.compare(_passwordEC, 'Senha esta diferente')
                    ]),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          final email = _emailEC.text;
                          final password = _passwordEC.text;
                          context
                              .read<RegisterController>()
                              .registerUser(email, password);
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Salvar'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
