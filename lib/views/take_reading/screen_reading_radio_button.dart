import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/constants/images.dart';
import 'package:family_pro_health/constants/strings.dart';
import 'package:family_pro_health/helpers/route_config.dart';
import 'package:family_pro_health/views/shared/app_button.dart';
import 'package:family_pro_health/views/shared/beneficiary_name.dart';
import 'package:family_pro_health/views/shared/page_structure.dart';
import 'package:family_pro_health/views/shared/radio_button_selection.dart';
import 'package:flutter/material.dart';

class ScreenReadingWithSelection extends StatefulWidget {
  const ScreenReadingWithSelection({
    required this.image,
    required this.tagTitle,
    super.key,
  });

  final String? image;
  final String? tagTitle;

  @override
  State<ScreenReadingWithSelection> createState() => _ScreenReadingWithSelectionState();
}

class _ScreenReadingWithSelectionState extends State<ScreenReadingWithSelection> {
  late String val1;
  late String val2;

  @override
  void initState() {
    val1 = "None";
    val2 = "None";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageStructure(
      title: 'Take Reading',
      backGroundColor: Colors.white,
      selected: 0,
      showSelected: true,
      showBack: true,
      showNotification: false,
      child: Column(
        children: <Widget>[
          BeneficiaryName(
            showTag: true,
            // img: widget.image,
            // tagTitle: widget.tagTitle,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 14),
                        child: const Divider(
                          height: 2,
                          color: AppColors.primary90,
                          thickness: 1.5,
                        ),
                      ),
                      RadioButtonSelection(
                        items: const ['None', 'Before Medication', 'After Medication'],
                        title: 'Select Medications Instructions',
                        onChanged: (dynamic val) {
                          val1 = val;
                        },
                      ),
                      RadioButtonSelection(
                        items: const ['None', 'Before Breakfast', 'After Breakfast'],
                        title: 'Select Meal Instructions',
                        onChanged: (dynamic val) {
                          val2 = val;
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: AppButton(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        RouteConfig.reading,
                        arguments: {
                          "image": Images.pulseOxyIns,
                        },
                      );
                    },
                    text: 'Next'.toUpperCase(),
                    backgroundColor: AppColors.tertiary60,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
