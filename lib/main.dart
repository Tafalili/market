import 'package:flutter/material.dart';
import 'package:market/views/main_home/home_page.dart';
import 'package:market/views/auth/ui/login.dart';
import 'package:market/views/auth/ui/WIDGETS/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: true,

      title: 'Market',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.kScaffoldColor,

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MainHome(),
    );
  }
}
class OnMarket extends StatelessWidget {
  const OnMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
