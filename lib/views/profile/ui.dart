import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/views/auth/logic/authintication_cubit.dart';
import 'package:market/views/auth/ui/WIDGETS/app_colors.dart';
import 'package:market/views/auth/ui/login.dart';
import 'package:market/views/profile/elements_screen/my_ordeers.dart';
import 'package:market/views/profile/widgets/buttons_of_profile.dart';

import '../../core/components/user_model.dart';
import 'elements_screen/edit_nsme.dart';

class Nav_Profile extends StatefulWidget {
  @override
  State<Nav_Profile> createState() => _Nav_ProfileState();
}

class _Nav_ProfileState extends State<Nav_Profile> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthinticationCubit, AuthinticationState>(
  listener: (context, state) {
   if(state is LogOutSuccess){
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login(),));
   }
  },
  builder: (context, state) {
    AuthinticationCubit cubit = context.read<AuthinticationCubit>();
    GetUserModel? user = context.read<AuthinticationCubit>().userModel;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
            child: Center(
          child: Container(
            height: 450,
            margin: EdgeInsets.all(15),
            child: Card(

              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      maxRadius: 40,
                      backgroundColor: AppColors.kPrimaryColor,
                      child: Icon(
                        size: 40,
                        Icons.person,
                        color: AppColors.kWhiteColor,
                      ),
                    ),
                    SizedBox(height: 15,),

                    Text(
                      user?.name ?? "user",
                      style: TextStyle(
                        color: AppColors.kBlackColor,
                      ),
                    ),
                    Text(
                     user?.email?? "email_user",
                      style: TextStyle(
                        color: AppColors.kGreyColor,
                      ),
                    ),
                    SizedBox(height: 20,),
                    profile_button(lable: 'تعديل الاسم',left: Icons.arrow_forward_ios_outlined,right: Icons.person, doIt: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Edit_Name() ,)); },),
                    SizedBox(height: 10,),

                    profile_button(lable: 'طلباتي',left: Icons.arrow_forward_ios_outlined,right: Icons.shopping_basket, doIt: () { Navigator.of(context).push(MaterialPageRoute(builder: (context) =>My_Orders() ,)); },),
                    SizedBox(height: 10,),

                    profile_button(lable: 'تسجيل الخروج',left: Icons.arrow_forward_ios_outlined,right: Icons.logout, doIt: () { cubit.SignOut(); },),

                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  },
);
  }
}

