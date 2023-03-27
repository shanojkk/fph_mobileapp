import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/constants/strings.dart';
import 'package:family_pro_health/views/shared/app_button.dart';
import 'package:family_pro_health/views/shared/reading_item.dart';
import 'package:flutter/material.dart';

class WeightReading extends StatelessWidget {
  const WeightReading({super.key});
  final String readingStatus = Strings.normal;

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: appSize.height / 5,
              child: Column(
                children: const [
                  ReadingItem(
                    unitTextHeight: 35,
                    unit: Strings.weightUnit,
                    type: Strings.weight,
                    value: '120',
                    status: '',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AppButton(
                  onTap: () {},
                  text: Strings.takeReading.toUpperCase(),
                  icon: Icons.add,
                  backgroundColor: AppColors.tertiary60,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
