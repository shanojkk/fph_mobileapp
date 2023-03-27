import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/constants/strings.dart';
import 'package:flutter/material.dart';

class ReadingItem extends StatelessWidget {
  const ReadingItem({
    required this.status,
    required this.type,
    required this.value,
    required this.unit,
    this.unitTextHeight = 25,
    super.key,
  });

  final String status;
  final String type;
  final String value;
  final String unit;
  final double unitTextHeight;

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;
    final Color readingColor;
    switch (status) {
      case Strings.normal:
        {
          readingColor = AppColors.success50;
          break;
        }
      case Strings.high:
        {
          readingColor = AppColors.error40;
          break;
        }
      case Strings.low:
        {
          readingColor = AppColors.warning50;
          break;
        }
      default:
        {
          readingColor = AppColors.neutralVariant10;
          break;
        }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        width: appSize.width / 3,
        // height: appSize.height / 7.5,
        child: Column(
          children: [
            SizedBox(
              // height: unitTextHeight,
              child: Text(
                type.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.neutralVariant10,
                ),
                maxLines: 2,
              ),
            ),
            value != ""
                ? Text(
                    value,
                    style: TextStyle(
                      fontSize: appSize.width * 0.08,
                      fontWeight: FontWeight.w500,
                      color: readingColor,
                    ),
                  )
                :  Text(
                    "--",
                    style: TextStyle(
                      fontSize: appSize.width * 0.08,
                      fontWeight: FontWeight.w500,
                      color: AppColors.neutralVariant50,
                    ),
                  ),
            Text(
              unit,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.neutralVariant50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
