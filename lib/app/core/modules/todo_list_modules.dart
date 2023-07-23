import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:todo_list_with_provider_firebase/app/core/modules/todo_list_page.dart';

abstract class TodoListModules {
  final Map<String, WidgetBuilder> _routes;
  final List<SingleChildWidget>? _bindings;

  TodoListModules({
    required Map<String, WidgetBuilder> routes,
    List<SingleChildWidget>? bindings,
  })  : _routes = routes,
        _bindings = bindings;

  Map<String, WidgetBuilder> get routes {
    return _routes.map((key, pageBuilder) {
      return MapEntry(
        key,
        (context) => TodoListPage(
          bindings: _bindings,
          page: pageBuilder,
        ),
      );
    });
  }
}
