import 'package:family_pro_health/constants/app_colors.dart';
import 'package:flutter/widgets.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({this.center = false, required this.text, super.key});

  final String? text;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textAlign: center ? TextAlign.center : TextAlign.start,
      style: const TextStyle(
        fontSize: 14,
        color: AppColors.error40,
        height: 1.48,
        letterSpacing: 1,
      ),
    );
  }
}
