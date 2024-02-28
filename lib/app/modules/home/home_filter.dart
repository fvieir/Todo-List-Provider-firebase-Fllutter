import 'package:flutter/material.dart';
import 'package:todo_list_with_provider_firebase/app/core/ui/theme_extensions.dart';
import 'package:todo_list_with_provider_firebase/app/modules/home/home_card_filter.dart';

class HomeFilter extends StatefulWidget {
  const HomeFilter({super.key});

  @override
  State<HomeFilter> createState() => _HomeFilterState();
}

class _HomeFilterState extends State<HomeFilter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FILTROS',
            style: context.titleStyle.copyWith(fontSize: 16),
          ),
          const SizedBox(height: 15),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                HomeCardFilter(),
                HomeCardFilter(),
                HomeCardFilter(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
