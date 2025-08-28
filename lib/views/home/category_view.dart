import 'package:flutter/material.dart';
import 'package:market/core/components/list_of_products.dart';
import 'package:market/views/prouduct_detiles/detiles_of_product.dart';

import '../../core/components/search_fild.dart';

class Catigory_view extends StatelessWidget {
  const Catigory_view({super.key, required, required this.catigory });
final String catigory;
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back_ios)),
                  Text(
                    "$catigory",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),
            List_of_products(
              category: catigory,
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
