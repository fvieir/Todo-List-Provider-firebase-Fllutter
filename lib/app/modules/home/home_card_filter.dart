import 'package:flutter/material.dart';
import 'package:todo_list_with_provider_firebase/app/core/ui/theme_extensions.dart';

class HomeCardFilter extends StatelessWidget {
  const HomeCardFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 10),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          color: context.primaryColor,
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Task',
            style: context.titleStyle.copyWith(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Hoje',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5),
          LinearProgressIndicator(
            backgroundColor: context.primaColorLigth,
            minHeight: 6,
            value: 0.4,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ],
      ),
    );
  }
}
