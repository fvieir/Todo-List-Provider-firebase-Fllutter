import 'package:flutter/material.dart';
import 'package:todo_list_with_provider_firebase/app/core/ui/theme_extensions.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'E ai, Fabrício Dourado',
          style: context.textTheme.headlineSmall?.copyWith(
            color: context.primaryColor,
          ),
        )
      ],
    );
  }
}
