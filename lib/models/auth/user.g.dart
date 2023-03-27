// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      address: json['address'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      countryCode: json['countryCode'] as String?,
      dob: json['dob'] as String?,
      email: json['email'] as String?,
      firstName: json['firstName'] as String?,
      gender: json['gender'] as String?,
      hasAcceptedTnC: json['hasAcceptedTnC'] as bool?,
      height: (json['height'] as num?)?.toDouble(),
      lastName: json['lastName'] as String?,
      middleName: json['middleName'] as String?,
      mobileNumer: json['mobileNumer'] as String?,
      parentId: json['parentId'] as String?,
      passcode: json['passcode'] as String?,
      password: json['password'] as String?,
      pinCode: json['pinCode'] as String?,
      remarks: json['remarks'] as String?,
      state: json['state'] as String?,
      status: json['status'] as String?,
      tenantId: json['tenantId'] as String?,
      title: json['title'] as String?,
      userID: json['userID'] as String?,
    )
      ..deletedOn = json['deletedOn'] as String?
      ..deletedBy = json['deletedBy'] as String?
      ..createdOn = json['createdOn'] as String?
      ..createdBy = json['createdBy'] as String?
      ..modifiedOn = json['modifiedOn'] as String?
      ..modifiedBy = json['modifiedBy'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'deletedOn': instance.deletedOn,
      'deletedBy': instance.deletedBy,
      'createdOn': instance.createdOn,
      'createdBy': instance.createdBy,
      'modifiedOn': instance.modifiedOn,
      'modifiedBy': instance.modifiedBy,
      'userID': instance.userID,
      'tenantId': instance.tenantId,
      'parentId': instance.parentId,
      'mobileNumer': instance.mobileNumer,
      'email': instance.email,
      'password': instance.password,
      'passcode': instance.passcode,
      'hasAcceptedTnC': instance.hasAcceptedTnC,
      'status': instance.status,
      'remarks': instance.remarks,
      'title': instance.title,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'pinCode': instance.pinCode,
      'dob': instance.dob,
      'gender': instance.gender,
      'height': instance.height,
      'countryCode': instance.countryCode,
    };
