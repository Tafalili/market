import 'package:flutter/material.dart';
import '../../core/components/list_of_products.dart';
import '../../core/components/search_fild.dart';


class Nav_Store extends StatefulWidget {
  const Nav_Store({super.key});

  @override
  State<Nav_Store> createState() => _Nav_StoreState();
}

class _Nav_StoreState extends State<Nav_Store> {



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



                SizedBox(
                  height: 15,
                ),
                List_of_products()
              ],
            ),
          ),
        ),
      ),
    );
  }
}



