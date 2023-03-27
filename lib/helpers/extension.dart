import 'package:family_pro_health/constants/enum.dart';
import 'package:intl/intl.dart';

extension FormatDate on String {
  String formatDate() {
    return DateFormat("MMM dd, yyyy hh:mm a").format(DateTime.parse(this));
  }
}

extension DateTimeFormat on DateTime {
  String convertToDate({String? pattern}) {
    return DateFormat(pattern ?? "MMM dd, yyyy hh:mm a").format(this);
  }
}

extension DeviceMapping on Devices {
  String get getName {
    switch (this) {
      case Devices.pulseOxy:
        return "BPL iOxy";
    }
  }
}
