import 'package:flutter/material.dart';

import '../../../../core/components/cach_image.dart';
import 'app_colors.dart';

class card_product_show_discount extends StatelessWidget {
  const card_product_show_discount({
    super.key, required this.image_url, required this.discount_value, required this.Product_name, required this.new_price, required this.old_price,
  });

  final String image_url;
  final String discount_value;
  final String Product_name;
  final String new_price;
  final String old_price;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          )),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                child: cach_image(url: image_url,),
              ),
              Transform.translate(
                offset: Offset(-232, 0),
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      )
                  ),
                  child: Center(
                    child: Text(
                      discount_value,
                      style: TextStyle(color: AppColors.kWhiteColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  width: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Product_name,
                      style: TextStyle(fontSize: 20),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.favorite))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          new_price,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          old_price,
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 20,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "اشتري الان",
                        style:
                        TextStyle(color: AppColors.kWhiteColor),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.kPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(8))),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

