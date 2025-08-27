import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/components/home_cubit/home_cubit.dart';
import 'package:market/core/components/prodacts_model.dart';

import '../../views/home/home_tools/card_of_products.dart';

class List_of_products extends StatelessWidget {
  const List_of_products({
    sup,
    required this.shrink,
    this.phisics,  this.quiry,
  });

  final bool shrink;
  final ScrollPhysics? phisics;
   final String? quiry;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getDataSupa(quiry:quiry ),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          List<ProdactsModel> products = quiry != null ? context.read<HomeCubit>().searchResult: context.read<HomeCubit>().product ;
          return ListView.builder(
            itemBuilder: (context, index) => card_of_products(

              prodactsModel:products[index],
            ),
            itemCount: products.length,
            physics: phisics,
            shrinkWrap: shrink,
          );
        },
      ),
    );
  }
}
