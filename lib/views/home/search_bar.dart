import 'package:flutter/material.dart';
import 'package:market/core/components/list_of_products.dart';
import 'package:market/views/prouduct_detiles/detiles_of_product.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(centerTitle: true, title: Text("Search"),) ,
      body: ListView(
        children: [
          SizedBox(height: 20,),
List_of_products(shrink: true)        ],
      ),
    );
  }
}
