import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:market/core/functions/appbar.dart';
import 'package:market/views/auth/ui/WIDGETS/app_colors.dart';
import 'package:market/views/auth/ui/WIDGETS/text_form_fild.dart';
import 'package:market/views/prouduct_detiles/tools/rating_bar.dart';

import '../../core/components/cach_image.dart';

class Product_Detiles extends StatelessWidget {
  TextEditingController comment_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: buildAppBar(context, "معلومات المنتج"),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  cach_image(
                    url:
                        'https://cdn.prod.website-files.com/5ee0a01b09389eebf4c09b45/65e607e3204a6d1354fc81d9_Rectangle%20995.webp',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('شموع اروما'),
                      Text('20 الف'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('0'),
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
