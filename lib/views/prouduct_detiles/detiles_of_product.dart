import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/components/circle_progress_indicator.dart';
import 'package:market/core/functions/appbar.dart';
import 'package:market/views/auth/ui/WIDGETS/app_colors.dart';
import 'package:market/views/auth/ui/WIDGETS/text_form_fild.dart';
import 'package:market/views/favorate/logic/favorate_model.dart';
import 'package:market/views/prouduct_detiles/rate/logic/product_detiles_cubit.dart';
import 'package:market/views/prouduct_detiles/rate/ratemodel.dart';
import 'package:market/views/prouduct_detiles/rate/rating_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../core/components/cach_image.dart';
import '../../core/components/prodacts_model.dart';
import '../../core/components/user_model.dart';
import '../auth/logic/authintication_cubit.dart';
import '../favorate/logic/favorate_cubit.dart';

class Product_Detiles extends StatefulWidget {
  final ProdactsModel prodactsModel;
   FavorateModel? favModel;

  Product_Detiles({super.key, required this.prodactsModel,  this.favModel});

  @override
  State<Product_Detiles> createState() => _Product_DetilesState();
}

class _Product_DetilesState extends State<Product_Detiles> {
  TextEditingController comment_controller = TextEditingController();
  bool _isFavorate = true;


  @override
  void dispose() {
    comment_controller;
    // TODO: implement dispose
    super.dispose();
  }

  final Ratemodel rm = Ratemodel();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => product_detilesCubit()
        ..getproduct_detiless(product_id: widget.prodactsModel.productId!),
),
    BlocProvider(
      create: (context) => FavorateCubit()..getFavStatus(productID:widget.favModel!.forProduct??"" ),
    ),
  ],
  child: BlocConsumer<product_detilesCubit, product_detilesState>(
        listener: (context, state) {
          if (state is product_detilesLoding) {
            Center(
              child: circle_progress(),
            );
          }
        },
        builder: (context, state) {
          product_detilesCubit cubit = context.read<product_detilesCubit>();
          GetUserModel? user = context.read<AuthinticationCubit>().userModel;

          return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(
                appBar: buildAppBar(context, "معلومات المنتج"),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        cach_image(
                          url: widget.prodactsModel.imageUrl ??
                              'https://cdn.prod.website-files.com/5ee0a01b09389eebf4c09b45/65e607e3204a6d1354fc81d9_Rectangle%20995.webp',
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${widget.prodactsModel.productName}'),
                            Text('${widget.prodactsModel.price} الف'),
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
                                onPressed: () {
                                  setState(() {
                                    if(widget.favModel!.isFavorate==_isFavorate){
                                      _isFavorate;
                                    }else {
                                      _isFavorate =  !_isFavorate;
                                    }
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite,
                                  color: _isFavorate?AppColors.kGreyColor:AppColors.kPrimaryColor,
                                ))
                          ],
                        ),
                        Center(
                          child: rating(
                            prodactsModel: widget.prodactsModel,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTFF(
                            control_password: comment_controller,
                            lable: 'ادخل تعليقك',
                            suffexicon: IconButton(
                              onPressed: () async {
                                await context
                                    .read<AuthinticationCubit>()
                                    .FetchData();
                                await cubit.addComments({
                                  "comment": comment_controller.text,
                                  "for_user": Supabase
                                      .instance.client.auth.currentUser?.id,
                                  "for_product": widget.prodactsModel.productId,
                                  "user_name": context
                                          .read<AuthinticationCubit>()
                                          .userModel
                                          ?.name ??
                                      "user_name"
                                });
                                comment_controller.clear();
                              },
                              icon: Icon(Icons.send),
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
                        user_comment(
                          prodactsModel: widget.prodactsModel,
                        )
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

class user_comment extends StatelessWidget {
  const user_comment({
    super.key,
    required this.prodactsModel,
  });

  final ProdactsModel prodactsModel;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Supabase.instance.client
            .from("comments")
            .stream(primaryKey: ["id"])
            .eq("for_product", prodactsModel.productId!)
            .order("created_at"),
        builder: (_, snapshot) {
          List<Map<String, dynamic>>? data = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: circle_progress(),
            );
          } else if (snapshot.hasData) {
            return ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => comment_list(
                      commetsMap: data[index],
                    ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: data!.length);
            return Center(
              child: Text("No Comments Yet"),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text("No Comments Yet"),
            );
          } else {
            return Center(
              child: Text("There are an error"),
            );
          }
        });
  }
}

class comment_list extends StatelessWidget {
  const comment_list({
    super.key,
    required this.commetsMap,
  });

  final Map<String, dynamic> commetsMap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 230),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            commetsMap["user_name"] ?? "userName",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text(commetsMap["comment"] ?? "comment"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 72),
            child: Text(
              commetsMap["replay"] ?? "",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
