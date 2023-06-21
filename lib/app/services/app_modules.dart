import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_with_provider_firebase/app/services/app_widget.dart';

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
        Provider(create: (context) => Object()),
      ],
      child: const AppWidget(),
    );
  }
}
