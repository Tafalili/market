import 'package:flutter/material.dart';
import 'package:market/views/home/home_tools/popler_categories.dart';

import '../category_view.dart';

class sliding_catigories_list_view extends StatelessWidget {
   sliding_catigories_list_view({
    super.key,
    required this.categori,
  });

  final List<Map<String, Object>> categori;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80, // Define height to fix unbounded height error
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categori.length, // Example count
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return PopularCategories(
            key: ValueKey(index),
            label: categori[index]["label"] as String , // Dynamic label for variety
            icon: categori[index]['icon'] as IconData,
            action: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Catigory_view(catigory:categori[index]["label"] as String,),)) ; },
          );
        },
      ),
    );
  }
}
