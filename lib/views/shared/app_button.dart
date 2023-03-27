import 'package:family_pro_health/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    this.caps = false,
    required this.onTap,
    this.radius,
    required this.text,
    this.textColor,
    required this.backgroundColor,
    this.outlined = false,
    this.weight,
    this.textSize,
    this.icon,
    super.key,
  });

  final String text;
  final VoidCallback onTap;
  final double? radius;
  final bool caps;
  final Color? textColor;
  final double? textSize;
  final Color backgroundColor;
  final bool outlined;
  final FontWeight? weight;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor: outlined ? Colors.transparent : backgroundColor,
        foregroundColor: textColor ?? Colors.white,
        side:
            outlined ? const BorderSide(color: AppColors.primaryPallete) : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? 6),
          ),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 20,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon, size: 18),
          Text(
            caps ? text.toUpperCase() : text,
            style: TextStyle(
              fontWeight: weight ?? FontWeight.bold,
              letterSpacing: 1,
              fontSize: textSize ?? 14,
            ),
          ),
        ],
      ),
    );
  }
}
