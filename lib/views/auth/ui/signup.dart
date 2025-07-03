import 'package:flutter/material.dart';
import 'package:market/views/auth/ui/forget_password.dart';
import 'WIDGETS/button_of_login.dart';
import 'WIDGETS/text_button.dart';
import 'WIDGETS/text_form_fild.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  TextEditingController control_username = TextEditingController();
  TextEditingController control_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                Center(
                    child: Text(
                      "اهلا بكم في متجرنا",
                      style: TextStyle(fontSize: 30),
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Form(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            CustomTFF(control_password: control_username, lable: "ادخل الاسم",textInputType: TextInputType.emailAddress,),
                            SizedBox(height: 17),
                            CustomTFF(control_password: control_username, lable: "ادخل الايميل ",textInputType: TextInputType.emailAddress,),
                            SizedBox(height: 17),
                            CustomTFF(control_password: control_password,lable: "ادخل الرمز السري",obscureText: true,suffexicon: Icon(Icons.visibility_off),textInputType: TextInputType.visiblePassword,),
                            SizedBox(height: 17),
                            CustomTFF(control_password: control_password,lable: "تأطيد الرقم السري",obscureText: true,suffexicon: Icon(Icons.visibility_off),textInputType: TextInputType.visiblePassword,),

                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 139),
                                child: TEXT_FORM_FILD(text: "هل نسيت كلمة المرور؟", press: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Forget_Password(),));
                                },)
                            ),
                            button_of_login(lable: "انشاء حساب",on_pressed: (){},),
                            button_of_login(lable: "سجل الدخول باستخدام GOOGLE",on_pressed: (){},),

                            Text("هل تمتلك حساب  ؟"),
                            TEXT_FORM_FILD(text: "سجل دخول من هن هنا", press: (){}),


                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





