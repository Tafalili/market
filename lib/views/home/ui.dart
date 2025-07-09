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
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: AppColors.kGreyColor)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black12)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: AppColors.kBlackColor,width: 2)),
                    contentPadding: EdgeInsets.symmetric(vertical: 13.5, horizontal: 12), // Sets TextFormField height
                    suffixIcon: ElevatedButton.icon(onPressed: (){}, label: const Icon(Icons.search,color: Colors.white,),style: ElevatedButton.styleFrom( fixedSize: Size(30, 20),backgroundColor: AppColors.kPrimaryColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                  suffixIconColor: AppColors.kWhiteColor,
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
