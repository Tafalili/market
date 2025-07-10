import 'package:flutter/material.dart';
import 'package:market/views/home/home_tools/slider.dart';
import '../../core/components/list_of_products.dart';
import '../../core/components/search_fild.dart';
import '../auth/ui/WIDGETS/app_colors.dart';
import 'home_tools/card_of_products.dart';
import 'home_tools/popler_categories.dart';
import 'home_tools/sliding_list_view.dart';

class Nav_Home extends StatefulWidget {
  const Nav_Home({super.key});

  @override
  State<Nav_Home> createState() => _Nav_HomeState();
}

class _Nav_HomeState extends State<Nav_Home> {
  List<Map<String, Object>> categories = [
    {'label': 'رياضة', 'icon': Icons.sports},
    {'label': 'الكترونيات', 'icon': Icons.computer},
    {'label': 'مجموعات', 'icon': Icons.collections},
    {'label': 'كتب', 'icon': Icons.book},
    {'label': 'العاب', 'icon': Icons.games_outlined},
    {'label': 'صحه وجمال', 'icon': Icons.health_and_safety_outlined},
    {'label': 'مكياج', 'icon': Icons.woman},
  ];


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // Align text properly for RTL
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: custom_search_fild(), // Fixed widget name assumption
                ),
                const HomeSlider(),
                const Padding(
                  padding: EdgeInsets.only(right: 16, top: 8),
                  // Adjusted for RTL
                  child: Text(
                    "الأقسام الرائجة",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                sliding_catigories_list_view(categories: categories),
                const Padding(
                  padding: EdgeInsets.only(right: 16, top: 8),
                  // Adjusted for RTL
                  child: Text(
                    "المنتجات المضافه حديثا",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                List_of_products(shrink: true,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}



