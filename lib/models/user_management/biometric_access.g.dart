// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometric_access.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BiometricAccess _$BiometricAccessFromJson(Map<String, dynamic> json) =>
    BiometricAccess(
      benificiaryIDs: json['benificiaryIDs'] as String?,
      biometricAccessID: json['biometricAccessID'] as String?,
      userID: json['userID'] as String?,
    )
      ..deletedOn = json['deletedOn'] as String?
      ..deletedBy = json['deletedBy'] as String?
      ..createdOn = json['createdOn'] as String?
      ..createdBy = json['createdBy'] as String?
      ..modifiedOn = json['modifiedOn'] as String?
      ..modifiedBy = json['modifiedBy'] as String?;

Map<String, dynamic> _$BiometricAccessToJson(BiometricAccess instance) =>
    <String, dynamic>{
      'deletedOn': instance.deletedOn,
      'deletedBy': instance.deletedBy,
      'createdOn': instance.createdOn,
      'createdBy': instance.createdBy,
      'modifiedOn': instance.modifiedOn,
      'modifiedBy': instance.modifiedBy,
      'biometricAccessID': instance.biometricAccessID,
      'userID': instance.userID,
      'benificiaryIDs': instance.benificiaryIDs,
    };
