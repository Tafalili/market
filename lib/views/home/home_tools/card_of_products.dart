import 'package:flutter/material.dart';
import 'package:market/core/components/prodacts_model.dart';
import 'package:market/views/prouduct_detiles/detiles_of_product.dart';
import '../../../core/components/cach_image.dart';
import '../../auth/ui/WIDGETS/app_colors.dart';
import '../../auth/ui/WIDGETS/card_product_discount.dart';

class card_of_products extends StatelessWidget {
  const card_of_products({
    super.key, required this.prodactsModel,
  });
final ProdactsModel prodactsModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => Product_Detiles(),));},
      child: card_product_show_discount(
        image_url: prodactsModel.imageUrl??"https://cdn.prod.website-files.com/5ee0a01b09389eebf4c09b45/65e607e3204a6d1354fc81d9_Rectangle%20995.webp",
        discount_value: 'خصم ${prodactsModel.sale}%', Product_name: prodactsModel.productName??'شموع اروما', new_price: '${prodactsModel.price} الف', old_price: '${prodactsModel.oldPrice} الف',),
    );
  }
}



