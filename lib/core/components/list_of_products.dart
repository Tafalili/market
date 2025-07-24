import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/components/home_cubit/home_cubit.dart';

import '../../views/home/home_tools/card_of_products.dart';

class List_of_products extends StatelessWidget {
  const List_of_products({
    sup, required this.shrink, this.phisics,
  });
final bool shrink;
 final ScrollPhysics? phisics;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => HomeCubit()..getDataSupa(),
  child: BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return ListView.builder(itemBuilder: (context, index) => card_of_products(prodactsModel: context.read<HomeCubit>().product[index],),itemCount: context.read<HomeCubit>().product.length,physics: phisics,shrinkWrap: shrink,);
  },
),
);
  }
}