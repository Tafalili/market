import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/home_page.dart';
import 'package:market/views/auth/logic/authintication_cubit.dart';

import 'WIDGETS/Custom_btn.dart';
import 'WIDGETS/text_form_fild.dart';

class Forget_Password extends StatefulWidget {
   Forget_Password({super.key});

  @override
  State<Forget_Password> createState() => _Forget_PasswordState();
}

class _Forget_PasswordState extends State<Forget_Password> {
TextEditingController forget_controller = TextEditingController();
@override
  void dispose() {
  forget_controller.dispose() ;
  super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthinticationCubit, AuthinticationState>(
  listener: (context, state) {
    if(state is ResetPasswordSuccess){
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainHome(),));
    }
   },
  builder: (context, state) {
    AuthinticationCubit cubit = context.read<AuthinticationCubit>();
    return SafeArea(
        child:
        Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50,),
                Text("ادخل الايميل الخاص بك لاعادة تهيئة كلمة المرور",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 40,),
                Container(
                  margin: EdgeInsets.all(15),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Padding(
                            padding: const EdgeInsets.only(top:25 ),
                            child: CustomTFF(control_password:forget_controller, lable: 'ايميل' ,textInputType: TextInputType.emailAddress,),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: Center(
                              child: Custom_btn(lable: 'ارسال',press: (){cubit.ResetPassword(forget_controller.text);},)
                          ),
                        )
                      ],
                    ),

                  ),
                )
              ],
            )),
      ),
    ));
  },
);
  }
}


