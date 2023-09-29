import 'package:flutter/material.dart';
import 'package:todo_list_with_provider_firebase/app/core/database/sqlite_adm_connection.dart';
import 'package:todo_list_with_provider_firebase/app/core/navigator/todo_list_navigator.dart';
import 'package:todo_list_with_provider_firebase/app/core/ui/todo_list_ui_config.dart';
import 'package:todo_list_with_provider_firebase/app/modules/auth/auth_module.dart';
import 'package:todo_list_with_provider_firebase/app/modules/home/home_module.dart';
import 'package:todo_list_with_provider_firebase/app/modules/splash/splash_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final _sqliteAdmConnection = SqliteAdmConnection();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(_sqliteAdmConnection);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(_sqliteAdmConnection);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO List',
      navigatorKey: TodoListNavigator.navigatorKey,
      home: const SplashPage(),
      theme: TodoListUiConfig.themeData,
      routes: {
        ...AuthModule().routes,
        ...HomeModule().routes,
      },
    );
  }
}
