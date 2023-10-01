import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_with_provider_firebase/app/auth/auth_provider.dart';
import 'package:todo_list_with_provider_firebase/app/core/database/sqlite_connection_factory.dart';
import 'package:todo_list_with_provider_firebase/app/repositories/user/user_repository_impl.dart';
import 'package:todo_list_with_provider_firebase/app/repositories/user/user_repository_interface.dart';
import 'package:todo_list_with_provider_firebase/app/services/app_widget.dart';
import 'package:todo_list_with_provider_firebase/app/services/user/user_services_impl.dart';
import 'package:todo_list_with_provider_firebase/app/services/user/user_services_interface.dart';

class AppModules extends StatefulWidget {
  const AppModules({super.key});

  @override
  State<AppModules> createState() => _AppModulesState();
}

class _AppModulesState extends State<AppModules> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => FirebaseAuth.instance),
        Provider(
          create: (context) => SqliteConnectionFactory(),
          lazy: false,
        ),
        Provider<IUserRepository>(
            create: (context) =>
                UserRepositoryImpl(firebaseAuth: context.read())),
        Provider<IUserServices>(
            create: (context) =>
                UserServicesImpl(userRepository: context.read())),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(
              firebaseAuth: context.read(), userServices: context.read())
            ..loadListerners(),
          lazy: false,
        ),
      ],
      child: const AppWidget(),
    );
  }
}
