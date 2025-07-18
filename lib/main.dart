import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:market/core/my_observer.dart';
import 'package:market/home_page.dart';
import 'package:market/views/auth/logic/authintication_cubit.dart';
import 'package:market/views/auth/ui/login.dart';
import 'package:market/views/auth/ui/WIDGETS/app_colors.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  Bloc.observer = MyObserver();

  // تحقق من صلاحية الجلسة
  final session = Supabase.instance.client.auth.currentSession;
  if (session != null) {
    try {
      final response = await Supabase.instance.client.auth.getUser();
      if (response.user == null) {
        // الجلسة غير صالحة - سجل خروج
        await Supabase.instance.client.auth.signOut();
      }
    } catch (_) {
      // في حال حدوث خطأ، سجل خروج أيضًا
      await Supabase.instance.client.auth.signOut();
    }
  }

  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
SupabaseClient client = Supabase.instance.client;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthinticationCubit(),
      child: MaterialApp(

        debugShowCheckedModeBanner: true,

        title: 'Market',
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.kScaffoldColor,

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:
        client.auth.currentUser != null?MainHome():Login(),
      ),
    );
  }
}


