import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:market/core/components/circle_progress_indicator.dart';
import 'package:market/views/prouduct_detiles/rate/ratemodel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/components/prodacts_model.dart';
import '../detiles_of_product.dart';
import 'logic/product_detiles_cubit.dart';

class rating extends StatelessWidget {
   rating({
    super.key, required this.prodactsModel
  });
  final ProdactsModel prodactsModel;

   void navigateWithoutBack(BuildContext context, dynamic view) {
     Navigator.pushReplacement(
       context,
       MaterialPageRoute(builder: (context) => Product_Detiles(prodactsModel: prodactsModel,)), // Replace with target
     );
   }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => product_detilesCubit()..getproduct_detiless(product_id: prodactsModel.productId!),
      child: BlocConsumer<product_detilesCubit, product_detilesState>(
        listener: (context, state) {
          if (state is update_rate_success) {
            navigateWithoutBack(context, this);
          }
        },
        builder: (context, state) {
          product_detilesCubit cubit = context.read<product_detilesCubit>();
          print("11111111111111111111111111111111111111111111");
          print(cubit.rateUser);
          print("11111111111111111111111111111111111111111111");

          return state is product_detilesLoding || state is update_rate_loading ?Center(child: circle_progress(),):
          RatingBar.builder(
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
             cubit.updateRate(productUser:prodactsModel.productId!, data:
               {

                 "rate":rating.toInt(),
                 "for_user":Supabase.instance.client.auth.currentUser!.id,
                 "for_product":prodactsModel.productId

               }
             );
            },
          );
        },
      ),
    );
  }
}
