import 'package:flutter/material.dart';
import 'package:market/views/home/home_tools/popler_categories.dart';

class sliding_catigories_list_view extends StatelessWidget {
  const sliding_catigories_list_view({
    super.key,
    required this.categories,
  });

  final List<Map<String, Object>> categories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, // Define height to fix unbounded height error
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length, // Example count
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return PopularCategories(
            key: ValueKey(index),
            label: categories[index]["label"] as String , // Dynamic label for variety
            icon: categories[index]['icon'] as IconData,
          );
        },
      ),
    );
  }
}