import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_with_provider_firebase/app/auth/auth_provider.dart';
import 'package:todo_list_with_provider_firebase/app/core/ui/theme_extensions.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: context.primaryColor.withAlpha(70),
            ),
            child: Row(
              children: [
                Selector<AuthProvider, String?>(
                  selector: (_, authProvider) => authProvider.user?.photoURL,
                  builder: (_, value, __) => CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(value ??
                        'https://media.istockphoto.com/id/1250000899/pt/vetorial/chat-bot-robot-avatar-in-circle-round-shape-isolated-on-white-background-stock-vector.jpg?s=1024x1024&w=is&k=20&c=-TjJNWuNNY-3gozUnZvstSDUcLO2Et2aW9qtnZVe054=https://media.istockphoto.com/id/1250000899/pt/vetorial/chat-bot-robot-avatar-in-circle-round-shape-isolated-on-white-background-stock-vector.jpg?s=1024x1024&w=is&k=20&c=-TjJNWuNNY-3gozUnZvstSDUcLO2Et2aW9qtnZVe054='),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Selector<AuthProvider, String?>(
                      selector: (_, authProvider) =>
                          authProvider.user?.displayName,
                      builder: (_, value, __) => Text(value ?? 'Não informado'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const ListTile(
            title: Text('Alterar Nome'),
          ),
          ListTile(
            onTap: () => context.read<AuthProvider>().logout(),
            title: const Text('Sair'),
          ),
        ],
      ),
    );
  }
}
