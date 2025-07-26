import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/components/circle_progress_indicator.dart';
import 'package:market/core/functions/appbar.dart';
import 'package:market/views/auth/ui/WIDGETS/app_colors.dart';
import 'package:market/views/auth/ui/WIDGETS/text_form_fild.dart';
import 'package:market/views/prouduct_detiles/rate/logic/product_detiles_cubit.dart';
import 'package:market/views/prouduct_detiles/rate/ratemodel.dart';
import 'package:market/views/prouduct_detiles/rate/rating_bar.dart';
import '../../core/components/cach_image.dart';
import '../../core/components/prodacts_model.dart';

class Product_Detiles extends StatelessWidget {

  TextEditingController comment_controller = TextEditingController();
  final Ratemodel rm=Ratemodel();
  final ProdactsModel prodactsModel;
   Product_Detiles({super.key, required this.prodactsModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => product_detilesCubit()..getproduct_detiless(product_id: prodactsModel.productId!),
      child: BlocConsumer<product_detilesCubit, product_detilesState>(
        listener: (context, state) {
          if(state is product_detilesLoding){
             Center(child: circle_progress(),);
          }
        },
        builder: (context, state) {
          product_detilesCubit cubit = context.read<product_detilesCubit>();

          return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                appBar: buildAppBar(context, "معلومات المنتج"),
                body: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        cach_image(
                          url:
                          prodactsModel.imageUrl??'https://cdn.prod.website-files.com/5ee0a01b09389eebf4c09b45/65e607e3204a6d1354fc81d9_Rectangle%20995.webp',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${prodactsModel.productName}'),
                            Text('${prodactsModel.price} الف'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text("${cubit.avaragerate}"),
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite,
                                  color: AppColors.kGreyColor,
                                ))
                          ],
                        ),
                        Center(
                          child: rating(),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTFF(
                            control_password: comment_controller,
                            lable: 'ادخل تعليقك',
                            suffexicon: Icon(
                              Icons.send,
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 230),
                          child: Text('التعليقات',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => comment_list(),
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: 10)
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}

class comment_list extends StatelessWidget {
  const comment_list({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 230),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'اسم المستخدم',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text('التعليق....'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 72),
            child: Text(
              'رد',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
