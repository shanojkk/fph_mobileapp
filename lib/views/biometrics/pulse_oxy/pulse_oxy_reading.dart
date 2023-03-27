import 'package:family_pro_health/constants/app_colors.dart';
import 'package:family_pro_health/constants/images.dart';
import 'package:family_pro_health/constants/strings.dart';
import 'package:family_pro_health/helpers/permission_helper.dart';
import 'package:family_pro_health/helpers/route_config.dart';
import 'package:family_pro_health/models/biometric/biometric_view_model.dart';
import 'package:family_pro_health/models/home/home_viewmodel.dart';
import 'package:family_pro_health/views/shared/app_button.dart';
import 'package:family_pro_health/views/shared/reading_item.dart';
import 'package:family_pro_health/views/shared/reading_label.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PulseOxyReading extends StatelessWidget {
  const PulseOxyReading({this.showButton = true, super.key});

  final bool showButton;

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    String readingStatus = "";
    return Consumer<BiometricViewModel>(builder: (context, viewModel, child) {
      //  if any reading is not equal to normal then it shows low.
      if (viewModel.biometricReading?.measurements != null) {
        if (viewModel.biometricReading!.measurements
            .every((item) => item.adherence == Strings.normal)) {
          readingStatus = Strings.normal;
        } else {
          readingStatus = Strings.low;
        }
      }

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ReadingItem(
                        status:
                            '${viewModel.biometricReading?.measurements[0].adherence}',
                        unit: Strings.percentage,
                        type: Strings.oxygenSaturation,
                        value: viewModel.biometricReading?.measurements[0].value ?? ""),
                    const SizedBox(
                      height: 80,
                      child: VerticalDivider(
                        color: AppColors.neutralVariant90,
                        thickness: 1,
                      ),
                    ),
                    ReadingItem(
                        status:
                            '${viewModel.biometricReading?.measurements[1].adherence}',
                        unit: Strings.pulseUnit,
                        type: Strings.pulseText,
                        value: viewModel.biometricReading?.measurements[1].value ?? ""),
                  ],
                ),
              ],
            ),
            if (readingStatus != "") const Expanded(child: SizedBox()),
            if (readingStatus != "") ReadingLabel(status: readingStatus),
            const Expanded(child: SizedBox()),
            if (showButton)
              AppButton(
                onTap: () {
                  PermissionHelper.instance.requestRequiredPermissions().then((value) {
                    // if permissions are granted then navigate to next screen
                    if (value) {
                      homeViewModel.updateImageAndTitle(
                        Images.pulseOxy,
                        Strings.pulseOxymeter,
                      );
                      Navigator.of(context).pushNamed(
                        RouteConfig.readingWithSelection,
                      );
                    }
                  });
                },
                text: Strings.takeReading.toUpperCase(),
                icon: Icons.add,
                backgroundColor: AppColors.tertiary60,
              )
          ],
        ),
      );
    });
  }
}
