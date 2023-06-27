import 'package:flutter/material.dart';
import 'package:todo_list_with_provider_firebase/app/core/database/sqlite_connection_factory.dart';

class SqliteAdmConnection with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final sqliteConnection = SqliteConnectionFactory();

    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        sqliteConnection.close();
        break;
    }
    super.didChangeAppLifecycleState(state);
  }
}
