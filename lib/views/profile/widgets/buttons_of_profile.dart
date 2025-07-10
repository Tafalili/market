import 'package:flutter/material.dart';
import '../../auth/ui/WIDGETS/app_colors.dart';

class profile_button extends StatelessWidget {
  const profile_button({
    super.key, required this.lable, required this.left, required this.right,
  });
  final String lable;
  final IconData left;
  final IconData right;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),),
          fixedSize: Size(250, 45)),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(right,color: AppColors.kWhiteColor),
          Text(
            lable,
            style: TextStyle(
                color: AppColors.kWhiteColor,
                fontWeight: FontWeight.bold),

          ),
          Icon(left,color: AppColors.kWhiteColor,),

        ],
      ),
    );
  }
}
