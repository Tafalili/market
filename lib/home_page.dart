import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:market/views/Nav_bar/logic/nav_bar_cubit.dart';
import 'package:market/views/home/home_nav_ui.dart';
import 'package:market/views/store/ui.dart';
import 'package:market/views/favorate/ui.dart';
import 'package:market/views/profile/ui.dart';
import 'views/auth/ui/WIDGETS/app_colors.dart';

class MainHome extends StatelessWidget {
  MainHome({super.key});

  final List<Widget> view = [
    Nav_Home(),
    Nav_Store(),

    Nav_Favorate(),
    Nav_Profile(),



  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => NavBarCubit(),
        child: BlocBuilder<NavBarCubit, NavBarState>(
          builder: (context, state) {
            return Scaffold(
              body: SafeArea(
                child: view[state.currentIndex], // Use state.currentIndex
              ),
              bottomNavigationBar: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                height: 68,
                child: GNav(

                  onTabChange: (index) {
                    context.read<NavBarCubit>().changeIndex(index); // Call the correct method
                    print('Selected tab index: $index');
                  },
                  rippleColor: Colors.blueAccent,
                  hoverColor: Colors.blueAccent,
                  haptic: true,
                  curve: Curves.easeOutExpo,
                  duration: const Duration(milliseconds: 200),
                  gap: 8,
                  color: AppColors.kGreyColor,
                  activeColor: AppColors.kWhiteColor,
                  iconSize: 24,
                  tabBackgroundColor: AppColors.kPrimaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
                  tabs: const [

                    GButton(
                      icon: Icons.home,
                      text: 'الرئيسيه',
                    ),
                    GButton(
                      icon: Icons.store,
                      text: 'المتجر',
                    ),

                    GButton(
                      icon: Icons.favorite,
                      text: 'المفضلات',
                    ),
                    GButton(
                      icon: Icons.person,
                      text: 'معلوماتي',
                    ),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}