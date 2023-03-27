import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/helpers/route_config.dart';
import 'package:family_pro_health/viewmodels/biometric_reading_view_model.dart';
import 'package:family_pro_health/views/shared/beneficiary_name.dart';
import 'package:family_pro_health/views/shared/instructions.dart';
import 'package:family_pro_health/views/shared/page_structure.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReadingInstructions extends StatelessWidget {
  const ReadingInstructions({
    required this.image,
    super.key,
  });

  final String? image;

  @override
  Widget build(BuildContext context) {
    Provider.of<BiometricReadingViewModel>(context, listen: false).init();

    final List<String> list = [
      'Place the Oximeter on a table surface or desk.',
      'Insert your index finger completely into the rubber pad cavity as shown.',
      'Press the power button to turn on the device.',
      'Wait for a few seconds until the reading is stable.',
      'The famhealthTM app will display the reading when it is completed.'
    ];

    return PageStructure(
      title: 'Take Reading',
      backGroundColor: Colors.white,
      selected: 0,
      showSelected: true,
      showBack: true,
      showNotification: false,
      child: Column(
        children: <Widget>[
          const BeneficiaryName(showTag: true),
          Expanded(
            child: Instructions(
              image: image!,
              textList: list,
            ),
          ),
          Consumer<BiometricReadingViewModel>(
            builder: (context, value, child) {
              if (value.navigate) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  Navigator.of(context).pushNamed(RouteConfig.readingSuccess);
                });
              }
              return child!;
            },
            child: showDialog(context),
          ),
        ],
      ),
    );
  }

  Widget showDialog(BuildContext context, [String tag = 'bp']) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.all(16),
          color: AppColors.scanningModalBackground,
          child: SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Scanning for ${tag.toUpperCase()} reading...',
                  style: const TextStyle(
                    color: AppColors.neutralVariant10,
                    fontSize: 14,
                    letterSpacing: 0.25,
                  ),
                ),
                const CircularProgressIndicator(
                  color: AppColors.primary30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
