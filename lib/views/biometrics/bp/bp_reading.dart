import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/constants/strings.dart';
import 'package:family_pro_health/views/shared/app_button.dart';
import 'package:family_pro_health/views/shared/reading_item.dart';
import 'package:family_pro_health/views/shared/reading_label.dart';
import 'package:flutter/material.dart';

class BPReading extends StatelessWidget {
  const BPReading({super.key});
  final String readingStatus = Strings.high;

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        children: <Widget>[
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReadingItem(
                      status: readingStatus,
                      unit: Strings.bpUnit,
                      type: Strings.systolicText,
                      value: '120'),
                  Transform.rotate(
                    angle: 82,
                    child: SizedBox(
                      height: appSize.height / 12,
                      child: const VerticalDivider(
                        color: AppColors.neutralVariant90,
                        thickness: 1,
                      ),
                    ),
                  ),
                  ReadingItem(
                      status: readingStatus,
                      unit: Strings.bpUnit,
                      type: Strings.diastolicText,
                      value: '120'),
                ],
              ),
              ReadingItem(
                  status: readingStatus,
                  unit: Strings.pulseUnit.toUpperCase(),
                  type: Strings.systolicText,
                  value: '120'),
            ],
          ),
          const Expanded(child: SizedBox()),
          ReadingLabel(status: readingStatus),
          const Expanded(child: SizedBox()),
          Align(
            alignment: Alignment.bottomCenter,
            child: AppButton(
              onTap: () {},
              text: Strings.takeReading.toUpperCase(),
              icon: Icons.add,
              backgroundColor: AppColors.tertiary60,
            ),
          )
        ],
      ),
    );
  }
}
