import 'package:family_pro_health/models/meta_data.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'user.g.dart';

@Entity()
@JsonSerializable()
class User extends MetaData {
  @JsonKey(includeFromJson: false)
  @Id()
  int id = 0;
  String? userID;
  String? tenantId;
  String? parentId;
  String? mobileNumer;
  String? email;
  String? password; // should be here or not?
  String? passcode;
  bool? hasAcceptedTnC;
  String? status;
  String? remarks;
  String? title;
  String? firstName;
  String? middleName;
  String? lastName;
  String? address;
  String? city;
  String? state;
  String? country;
  String? pinCode;
  String? dob;
  String? gender;
  double? height;
  String? countryCode;
  

  User({
    this.address,
    this.city,
    this.country,
    this.countryCode,
    this.dob,
    this.email,
    this.firstName,
    this.gender,
    this.hasAcceptedTnC,
    this.height,
    this.lastName,
    this.middleName,
    this.mobileNumer,
    this.parentId,
    this.passcode,
    this.password,
    this.pinCode,
    this.remarks,
    this.state,
    this.status,
    this.tenantId,
    this.title,
    this.userID,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
