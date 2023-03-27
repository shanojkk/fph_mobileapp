import 'package:family_pro_health/models/meta_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'comm_preferences.g.dart';

@Entity()
@JsonSerializable()
class CommPreferences extends MetaData {
  @JsonKey(includeFromJson: false)
  @Id()
  int id = 0;
  String? commPreferenceID;
  String? userID;
  String? commTypeID;
  String? notificationType;

  CommPreferences({
    this.commPreferenceID,
    this.commTypeID,
    this.notificationType,
    this.userID,
  });

  factory CommPreferences.fromJson(Map<String, dynamic> json) =>
      _$CommPreferencesFromJson(json);
}
