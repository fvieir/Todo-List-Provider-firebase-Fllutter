import 'package:flutter/material.dart';
import 'package:todo_list_with_provider_firebase/app/core/database/sqlite_connection_factory.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    var sql = SqliteConnectionFactory();
    sql.openConnection();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen'),
      ),
      body: Center(
        child: TextButton(
          child: const Text('login'),
          onPressed: () => Navigator.of(context).pushNamed('/login'),
        ),
      ),
    );
  }
}
