import 'package:flutter/material.dart';

import '../../views/home/home_tools/card_of_products.dart';

class List_of_products extends StatelessWidget {
  const List_of_products({
    sup, required this.shrink, this.phisics,
  });
final bool shrink;
 final ScrollPhysics? phisics;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) => card_of_products(),itemCount: 10,physics: phisics,shrinkWrap: shrink,);
  }
}