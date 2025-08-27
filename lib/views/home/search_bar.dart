import 'package:flutter/material.dart';
import 'package:market/core/components/list_of_products.dart';
import 'package:market/views/prouduct_detiles/detiles_of_product.dart';

import '../../core/components/search_fild.dart';

class SearchBar_screen extends StatelessWidget {
  const SearchBar_screen({super.key, required, required this.quiry });
final String quiry;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(centerTitle: true, title: Text("Search"),) ,
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
                quiry: quiry,
                shrink: true,
                phisics: const NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
