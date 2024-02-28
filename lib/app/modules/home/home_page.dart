import 'package:flutter/material.dart';
import 'package:todo_list_with_provider_firebase/app/core/ui/theme_extensions.dart';
import 'package:todo_list_with_provider_firebase/app/core/widget/todo_list_icons.dart';
import 'package:todo_list_with_provider_firebase/app/modules/home/home_drawer.dart';
import 'package:todo_list_with_provider_firebase/app/modules/home/home_filter.dart';
import 'package:todo_list_with_provider_firebase/app/modules/home/home_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: context.primaryColor),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            PopupMenuButton(
              icon: Icon(
                TodoListIcons.filter,
                color: context.primaryColor,
              ),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  child: Text('Mostrar tarefas concluidas'),
                )
              ],
            )
          ],
        ),
        drawer: const HomeDrawer(),
        backgroundColor: const Color(0xFFFAFBFE),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  minWidth: constraints.maxWidth,
                ),
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: const IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HomeHeader(),
                        HomeFilter(),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
