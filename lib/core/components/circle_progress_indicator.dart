
import 'package:flutter/material.dart';

import '../../views/auth/ui/WIDGETS/app_colors.dart';

class circle_progress extends StatelessWidget {
  const circle_progress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: AppColors.kPrimaryColor,);
  }
}