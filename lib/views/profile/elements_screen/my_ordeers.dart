import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/components/list_of_products.dart';
import '../../../core/functions/appbar.dart';

class My_Orders extends StatelessWidget {
  const My_Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl, child: Scaffold(
      appBar: buildAppBar(context,"طلباتي"),
      body: List_of_products(shrink: false,phisics: AlwaysScrollableScrollPhysics(),),
    ));
  }
}
