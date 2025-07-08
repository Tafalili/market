import 'package:flutter/material.dart';
import 'package:market/views/auth/ui/WIDGETS/app_colors.dart';

class Nav_Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(child:
        Center(child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
              child: TextFormField(

                decoration: InputDecoration(
                  label: Text("ابحث عن اي منتج من هنا",style: TextStyle(color: AppColors.kGreyColor),),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                  suffixIcon: Icon(Icons.search,),

                  fillColor: AppColors.kWhiteColor,
                  filled: true

                ),
              ),
            )
          ],
        )
          ,)
        ),
      ),
    );
  }
}
