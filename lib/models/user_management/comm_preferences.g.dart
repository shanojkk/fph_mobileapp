// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comm_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommPreferences _$CommPreferencesFromJson(Map<String, dynamic> json) =>
    CommPreferences(
      commPreferenceID: json['commPreferenceID'] as String?,
      commTypeID: json['commTypeID'] as String?,
      notificationType: json['notificationType'] as String?,
      userID: json['userID'] as String?,
    )
      ..deletedOn = json['deletedOn'] as String?
      ..deletedBy = json['deletedBy'] as String?
      ..createdOn = json['createdOn'] as String?
      ..createdBy = json['createdBy'] as String?
      ..modifiedOn = json['modifiedOn'] as String?
      ..modifiedBy = json['modifiedBy'] as String?;

Map<String, dynamic> _$CommPreferencesToJson(CommPreferences instance) =>
    <String, dynamic>{
      'deletedOn': instance.deletedOn,
      'deletedBy': instance.deletedBy,
      'createdOn': instance.createdOn,
      'createdBy': instance.createdBy,
      'modifiedOn': instance.modifiedOn,
      'modifiedBy': instance.modifiedBy,
      'commPreferenceID': instance.commPreferenceID,
      'userID': instance.userID,
      'commTypeID': instance.commTypeID,
      'notificationType': instance.notificationType,
    };
