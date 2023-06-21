import 'package:flutter/material.dart';
import 'package:todo_list_with_provider_firebase/app/modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TODO List',
      home: SplashPage(),
    );
  }
}
