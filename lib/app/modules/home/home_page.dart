import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_with_provider_firebase/app/auth/auth_provider.dart';
import 'package:todo_list_with_provider_firebase/app/modules/home/home_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => context.read<AuthProvider>().logout(),
          child: const Text('Sair'),
        ),
      ),
    );
  }
}
