import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:market/views/home/ui.dart';
import 'package:market/views/profile/ui.dart';
import 'package:market/views/store/ui.dart';

import '../auth/ui/WIDGETS/app_colors.dart';
import '../favorate/ui.dart';

class MainHome extends StatelessWidget {
   MainHome({super.key});
List<Widget> view=[
  Nav_Home(),
  Nav_Store(),
  Nav_Favorate(),
  Nav_Profile()
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child:
      view[1],
      ),
      bottomNavigationBar: Container(

        decoration: BoxDecoration(
          color: Colors.white
        ),
        height: 68,
        child: GNav(

onTabChange: (value) {
  print('Selected tab index: $value');},
            rippleColor: Colors.blueAccent, // tab button ripple color when pressed
            hoverColor: Colors.blueAccent, // tab button hover color
            haptic: true, // haptic feedback
            // tabBorderRadius: 15,
            // tabActiveBorder: Border.all(color: Colors.black, width: 1), // tab button border
            // tabBorder: Border.all(color: Colors.grey, width: 1), // tab button border
            // tabShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)], // tab button shadow
            curve: Curves.easeOutExpo, // tab animation curves
            duration: Duration(milliseconds: 200), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: AppColors.kGreyColor, // unselected icon color
            activeColor: AppColors.kWhiteColor, // selected icon and text color
            iconSize: 24, // tab button icon size
            tabBackgroundColor: AppColors.kPrimaryColor, // selected tab background color
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 13), // navigation bar padding
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.store,
                text: 'Category',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Likes',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              )
            ]
        ),
      ),
    );

  }
}
