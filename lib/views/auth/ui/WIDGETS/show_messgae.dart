import 'package:flutter/material.dart';
import 'package:market/views/auth/ui/WIDGETS/app_colors.dart';

import '../../logic/authintication_cubit.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> ShowMesage(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        textAlign: TextAlign.center,
      ),
      backgroundColor: AppColors.kPrimaryColor,
      duration: const Duration(seconds: 5),
    ),
  );
}