import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:market/core/components/circle_progress_indicator.dart';
import 'package:market/views/prouduct_detiles/rate/ratemodel.dart';

import '../../../core/components/prodacts_model.dart';
import 'logic/product_detiles_cubit.dart';

class rating extends StatelessWidget {
   rating({
    super.key, required this.prodactsModel
  });
  final ProdactsModel prodactsModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => product_detilesCubit()..getproduct_detiless(product_id: prodactsModel.productId!),
      child: BlocConsumer<product_detilesCubit, product_detilesState>(
        listener: (context, state) {
          if(state is product_detilesLoding ){
            Center(child: circle_progress(),);
          }
        },
        builder: (context, state) {
          product_detilesCubit cubit = context.read<product_detilesCubit>();
          print("11111111111111111111111111111111111111111111");
          print(cubit.rateUser);
          print("11111111111111111111111111111111111111111111");

          return RatingBar.builder(
            initialRating: cubit.rateUser.toDouble(),
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) =>
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          );
        },
      ),
    );
  }
}
