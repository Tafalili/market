import 'package:flutter/material.dart';

import '../../auth/ui/WIDGETS/app_colors.dart';

class card_of_products extends StatelessWidget {
  const card_of_products({
    super.key,
  });

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
                  child: Image(
                    image: NetworkImage(
                        "https://cdn.prod.website-files.com/5ee0a01b09389eebf4c09b45/65e607e3204a6d1354fc81d9_Rectangle%20995.webp"),
                  )),
              Transform.translate(
                offset: Offset(-232, -4),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "خصم 10%",
                    style: TextStyle(color: AppColors.kWhiteColor),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(120, 30),
                      backgroundColor: AppColors.kPrimaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ))),
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
                      "اسم المنتج",
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
                          "20 الف",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "30 الف",
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
