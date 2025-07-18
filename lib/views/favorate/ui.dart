import 'package:flutter/material.dart';
import 'package:market/views/home/home_tools/slider.dart';
import '../../core/components/list_of_products.dart';
import '../../core/components/search_fild.dart';

class Nav_Favorate extends StatefulWidget {
  const Nav_Favorate({super.key});

  @override
  State<Nav_Favorate> createState() => _Nav_FavorateState();
}

class _Nav_FavorateState extends State<Nav_Favorate> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: null, // Explicitly disable FAB
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "المنتجات المفضله",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: custom_search_fild(), // Add missing search field
                ),

                const SizedBox(height: 15),
                List_of_products(
                  shrink: true,
                  phisics: const NeverScrollableScrollPhysics(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}