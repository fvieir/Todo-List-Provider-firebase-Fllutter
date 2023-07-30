import 'package:flutter/material.dart';
import 'package:todo_list_with_provider_firebase/app/core/ui/theme_extensions.dart';
import 'package:todo_list_with_provider_firebase/app/core/widget/todo_list_field.dart';
import 'package:todo_list_with_provider_firebase/app/core/widget/todo_list_logo.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
              child: Column(
                children: [
                  TodoListField(label: 'E-mail'),
                  const SizedBox(height: 20),
                  TodoListField(
                    label: 'Senha',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  TodoListField(
                    label: 'Confirme Senha',
                    obscureText: true,
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
                      onPressed: () {},
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
