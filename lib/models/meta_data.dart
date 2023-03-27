import 'package:json_annotation/json_annotation.dart';

part 'meta_data.g.dart';

@JsonSerializable()
class MetaData {
  String? deletedOn;
  String? deletedBy;
  String? createdOn;
  String? createdBy;
  String? modifiedOn;
  String? modifiedBy;

  MetaData({
    this.createdBy,
    this.createdOn,
    this.deletedBy,
    this.deletedOn,
    this.modifiedBy,
    this.modifiedOn,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => _$MetaDataFromJson(json);
}
