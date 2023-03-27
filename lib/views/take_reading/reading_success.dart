import 'package:family_pro_health/constants/enum.dart';
import 'package:family_pro_health/constants/strings.dart';
import 'package:family_pro_health/helpers/extension.dart';
import 'package:family_pro_health/helpers/preferences.dart';
import 'package:family_pro_health/models/biometric/biometric_view_model.dart';
import 'package:family_pro_health/models/home/home_viewmodel.dart';
import 'package:family_pro_health/views/biometrics/pulse_oxy/pulse_oxy_reading.dart';
import 'package:family_pro_health/views/shared/beneficiary_name.dart';
import 'package:family_pro_health/views/shared/page_structure.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReadingSuccess extends StatelessWidget {
  const ReadingSuccess({super.key});

  // final String biometricType;

  @override
  Widget build(BuildContext context) {
    Provider.of<BiometricViewModel>(context, listen: false).getLastReading(
      Preferences.instance.getName(),
      Devices.pulseOxy.getName,
    );
    return PageStructure(
      showBack: true,
      title: "Take Reading",
      selected: 0,
      showNotification: false,
      child: Column(
        children: <Widget>[
          const BeneficiaryName(),
          Expanded(
            child: Consumer<HomeViewModel>(builder: (context, viewModel, child) {
              return reading(viewModel.biometricType);
            }),
          ),
        ],
      ),
    );
  }

  Widget reading(biometricType) {
    if (biometricType == Strings.pulseOxymeter) {
      return const PulseOxyReading(showButton: false);
    } else {
      return Container();
    }
  }
}
