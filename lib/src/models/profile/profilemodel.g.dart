// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profilemodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileModel _$$_ProfileModelFromJson(Map<String, dynamic> json) =>
    _$_ProfileModel(
      fullname: json['fullname'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      experience: json['experience'] as String,
      pfp: json['pfp'] as String,
    );

Map<String, dynamic> _$$_ProfileModelToJson(_$_ProfileModel instance) =>
    <String, dynamic>{
      'fullname': instance.fullname,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'address': instance.address,
      'experience': instance.experience,
      'pfp': instance.pfp,
    };
