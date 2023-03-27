import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/constants/strings.dart';
import 'package:flutter/material.dart';

class ReadingLabel extends StatelessWidget {
  const ReadingLabel({required this.status, super.key});

  final String status;

  @override
  Widget build(BuildContext context) {
    final Color labelTextColor;
    final Color labelBgColor;
    switch (status) {
      case Strings.normal:
        {
          labelTextColor = AppColors.success50;
          labelBgColor = AppColors.success95;
          break;
        }
      case Strings.high:
        {
          labelTextColor = AppColors.error40;
          labelBgColor = AppColors.error80;
          break;
        }
      case Strings.low:
        {
          labelTextColor = AppColors.warning50;
          labelBgColor = AppColors.warning90;
          break;
        }
      default:
        {
          labelTextColor = AppColors.success50;
          labelBgColor = AppColors.success95;
          break;
        }
    }
    return DecoratedBox(
      decoration: BoxDecoration(
        color: labelBgColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(80, 16, 80, 16),
        child: Text(
          status.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: labelTextColor,
          ),
        ),
      ),
    );
  }
}
