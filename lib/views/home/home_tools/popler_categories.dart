import 'package:flutter/material.dart';

import '../../auth/ui/WIDGETS/app_colors.dart';

class PopularCategories extends StatelessWidget {
  const PopularCategories({
    super.key,
    required this.label,
    required this.icon,
    required this.action,
  });

  final String label;
  final IconData icon;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
            backgroundColor: AppColors.kPrimaryColor,
            radius: 24, // Adjust size as needed
            child: IconButton(
              onPressed: () {
                action(); // Fixed: Now actually calling the function
                print("Category pressed: $label");
              },
              icon: Icon(
                icon,
                color: AppColors.kWhiteColor,
                size: 28, // Adjust icon size
              ),
            )
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}