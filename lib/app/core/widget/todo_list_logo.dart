import 'package:flutter/material.dart';
import 'package:todo_list_with_provider_firebase/app/core/ui/theme_extensions.dart';

class TodoListLogo extends StatelessWidget {
  const TodoListLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/logo.png',
          height: 200,
        ),
        Text(
          'Todo List',
          style: context.textTheme.titleLarge,
        ),
      ],
    );
  }
}
