import 'package:flutter/material.dart';
import 'package:market/views/auth/ui/WIDGETS/app_colors.dart';
import 'package:market/views/auth/ui/WIDGETS/button_of_login.dart';
import 'package:market/views/auth/ui/WIDGETS/text_form_fild.dart';

import 'WIDGETS/Custom_btn.dart';

class Forget_Password extends StatelessWidget {
   Forget_Password({super.key});
TextEditingController forget_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:
        Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
            child: Column(
              children: [                SizedBox(height: 50,),

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
                                                 child: Custom_btn(lable: 'ارسال',press: (){},)
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
  }
}


