import 'package:family_pro_health/constants/app_colors.dart';
import 'package:flutter/material.dart';

class Bullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.0,
      width: 7.0,
      decoration: const BoxDecoration(
        color: AppColors.primaryPallete,
        shape: BoxShape.circle,
      ),
    );
  }
}