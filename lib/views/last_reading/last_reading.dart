import 'package:family_pro_health/constants/enum.dart';
import 'package:family_pro_health/constants/strings.dart';
import 'package:family_pro_health/helpers/extension.dart';
import 'package:family_pro_health/helpers/preferences.dart';
import 'package:family_pro_health/models/biometric/biometric_view_model.dart';
import 'package:family_pro_health/models/home/home_viewmodel.dart';
import 'package:family_pro_health/views/biometrics/bp/bp_reading.dart';
import 'package:family_pro_health/views/biometrics/glucose/glucose_reading.dart';
import 'package:family_pro_health/views/biometrics/lung_capacity/lung_capacity_reading.dart';
import 'package:family_pro_health/views/biometrics/pulse_oxy/pulse_oxy_reading.dart';
import 'package:family_pro_health/views/biometrics/temperature/temperature_reading.dart';
import 'package:family_pro_health/views/biometrics/weight/weight_reading.dart';
import 'package:family_pro_health/views/shared/device_screen_scroll_header.dart';
import 'package:family_pro_health/views/shared/page_structure.dart';
import 'package:family_pro_health/views/shared/view_history_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LastReading extends StatelessWidget {
  const LastReading({super.key});

  @override
  Widget build(BuildContext context) {
    final biometricReading = Provider.of<BiometricViewModel>(context, listen: false);

    // const String userId = '100';
    // const String deviceTypeId = '10';
    biometricReading.getLastReading(
      Preferences.instance.getName(),
      Devices.pulseOxy.getName,
    );

    return PageStructure(
      title: "Hi, ${Preferences.instance.getName()}",
      showSelected: true,
      selected: 0,
      child: Column(
        children: <Widget>[
          const DeviceScreenScrollHeader(),
          const ViewHistoryHeader(),
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
    if (biometricType == Strings.bloodPressure) {
      return const BPReading();
    } else if (biometricType == Strings.temperature) {
      return const TemperatureReading();
    } else if (biometricType == Strings.pulseOxymeter) {
      return const PulseOxyReading();
    } else if (biometricType == Strings.glucose) {
      return const GlucoseReading();
    } else if (biometricType == Strings.weight) {
      return const WeightReading();
    } else if (biometricType == Strings.lungCapacity) {
      return const LungCapacityReading();
    } else {
      return const BPReading();
    }
  }
}
