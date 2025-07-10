import 'package:flutter/material.dart';

import '../../views/auth/ui/WIDGETS/app_colors.dart';

AppBar buildAppBar(BuildContext context,String name ) {
  return AppBar(
    iconTheme: IconThemeData(
        color: AppColors.kWhiteColor
    ),
    backgroundColor:AppColors.kPrimaryColor ,
    elevation: 50,
    title: Text(name,style: TextStyle(color: AppColors.kWhiteColor),),
    centerTitle: true,
  );
}