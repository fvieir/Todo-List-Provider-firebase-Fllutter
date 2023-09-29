import 'package:flutter/material.dart';
import 'package:todo_list_with_provider_firebase/app/core/database/sqlite_connection_factory.dart';
import 'package:todo_list_with_provider_firebase/app/core/widget/todo_list_logo.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    var sql = SqliteConnectionFactory();
    sql.openConnection();

    return const Scaffold(
      body: Center(
        child: SizedBox(
          height: 250,
          child: TodoListLogo(),
        ),
      ),
    );
  }
}
