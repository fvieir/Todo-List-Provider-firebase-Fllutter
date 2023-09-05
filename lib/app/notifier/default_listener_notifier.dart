import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:todo_list_with_provider_firebase/app/core/ui/messages.dart';
import 'package:todo_list_with_provider_firebase/app/notifier/default_change_notifier.dart';

class DefaultListenerNotifier {
  final DefaultChangeNotifier changeNotifier;

  DefaultListenerNotifier({required this.changeNotifier});

  void listener({
    required BuildContext context,
    required SuccessVoidCallback successCallback,
  }) {
    changeNotifier.addListener(() {
      if (changeNotifier.loading) {
        Loader.show(context);
      } else {
        Loader.hide();
      }

      if (changeNotifier.isSuccess) {
        successCallback(changeNotifier, this);
      } else if (changeNotifier.error != null) {
        Messages.of(context).showError(changeNotifier.error!);
      }
    });
  }

  void dispose() => changeNotifier.removeListener(() {});
}

typedef SuccessVoidCallback = void Function(
  DefaultChangeNotifier notifier,
  DefaultListenerNotifier listenerInstance,
);
