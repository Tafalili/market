import 'package:flutter/material.dart';

import '../../views/auth/ui/WIDGETS/app_colors.dart';

class custom_search_fild extends StatelessWidget {
  const custom_search_fild({
    super.key,  this.onpressed, this.controller,
  });
final VoidCallback? onpressed;
final TextEditingController ? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,



      decoration: InputDecoration(

          label: Text("ابحث عن اي منتج من هنا",style: TextStyle(color: AppColors.kGreyColor),),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: AppColors.kGreyColor)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.black12)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: AppColors.kBlackColor,width: 2)),
          contentPadding: EdgeInsets.symmetric(vertical: 13.5, horizontal: 12), // Sets TextFormField height
          suffixIcon: ElevatedButton.icon(onPressed: (){onpressed;}, label: const Icon(Icons.search,color: Colors.white,),style: ElevatedButton.styleFrom( fixedSize: Size(30, 20),backgroundColor: AppColors.kPrimaryColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
          suffixIconColor: AppColors.kWhiteColor,
          fillColor: AppColors.kWhiteColor,
          filled: true

      ),
    );
  }
}