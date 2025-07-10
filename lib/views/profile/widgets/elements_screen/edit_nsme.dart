import 'package:flutter/material.dart';
import 'package:market/views/auth/ui/WIDGETS/app_colors.dart';

import '../../../auth/ui/WIDGETS/text_form_fild.dart';

class Edit_Name extends StatelessWidget {
  Edit_Name({super.key});

  TextEditingController update_name_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTFF(
              lable: "اضف الاسم الذي ترغب بتحديثه",
              control_password: update_name_controller,
                        ),
            ),
          Center(
            child: ElevatedButton(onPressed: () {},
              child: Text("حدث"),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.kPrimaryColor,foregroundColor: AppColors.kWhiteColor,shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
            )
          )
            ],
          ),
        ),
      ),
    );
  }
}
