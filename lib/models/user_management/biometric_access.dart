import 'package:family_pro_health/models/meta_data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'biometric_access.g.dart';

@JsonSerializable()
class BiometricAccess extends MetaData {
  String? biometricAccessID;
  String? userID;
  String? benificiaryIDs;

  BiometricAccess({
    this.benificiaryIDs,
    this.biometricAccessID,
    this.userID,
  });

  factory BiometricAccess.fromJson(Map<String, dynamic> json) =>
      _$BiometricAccessFromJson(json);
}
