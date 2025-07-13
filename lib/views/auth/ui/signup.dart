import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/components/circle_progress_indicator.dart';
import 'package:market/home_page.dart';
import 'package:market/views/auth/logic/authintication_cubit.dart';
import 'WIDGETS/button_of_login.dart';
import 'WIDGETS/show_messgae.dart';
import 'WIDGETS/text_button.dart';
import 'WIDGETS/text_form_fild.dart';
import 'forget_password.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void dispose() {
    // تفريغ الكونترولرز عند التخلص من الشاشة لتفادي تسرب الذاكرة
    control_username.dispose();
    control_password.dispose();
    control_name.dispose();
    super.dispose();
  }
  TextEditingController control_username = TextEditingController();
  TextEditingController control_password = TextEditingController();
  TextEditingController control_name = TextEditingController();
  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthinticationCubit, AuthinticationState>(
      listener: (context, state) {
        if (state is Login_Success){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainHome(),));
        }
        if (state is Login_Error) {
          print("#############################################");
          print("${state.message}");
          print("#############################################");
          ShowMesage(context, state.message);
        }
      },
  builder: (context, state) {
        AuthinticationCubit cubit =context.read<AuthinticationCubit>() ;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: state is Login_Loading?circle_progress(): SingleChildScrollView(
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
                        key: _fromkey,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            CustomTFF(control_password: control_name, lable: "ادخل الاسم",textInputType: TextInputType.emailAddress,),
                            SizedBox(height: 17),
                            CustomTFF(control_password: control_username, lable: "ادخل الايميل ",textInputType: TextInputType.emailAddress,),
                            SizedBox(height: 17),
                            CustomTFF(control_password: control_password,lable: "ادخل الرمز السري",obscureText: true,suffexicon: Icon(Icons.visibility_off),textInputType: TextInputType.visiblePassword,),
                            SizedBox(height: 17),

                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 139),
                                child: TEXT_FORM_FILD(text: "هل نسيت كلمة المرور؟", press: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Forget_Password(),));
                                },)
                            ),
                            button_of_login(lable: "انشاء حساب",on_pressed: (){if(_fromkey.currentState!.validate()){
                              cubit.SignUp(email: control_username.text, password:control_password.text, name: control_name.text);
                            }},),
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
  },
);
  }
}





