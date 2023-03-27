// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaData _$MetaDataFromJson(Map<String, dynamic> json) => MetaData(
      createdBy: json['createdBy'] as String?,
      createdOn: json['createdOn'] as String?,
      deletedBy: json['deletedBy'] as String?,
      deletedOn: json['deletedOn'] as String?,
      modifiedBy: json['modifiedBy'] as String?,
      modifiedOn: json['modifiedOn'] as String?,
    );

Map<String, dynamic> _$MetaDataToJson(MetaData instance) => <String, dynamic>{
      'deletedOn': instance.deletedOn,
      'deletedBy': instance.deletedBy,
      'createdOn': instance.createdOn,
      'createdBy': instance.createdBy,
      'modifiedOn': instance.modifiedOn,
      'modifiedBy': instance.modifiedBy,
    };
