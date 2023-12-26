// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      email: json['email'] as String,
      name: json['name'] as String,
      division: Division.fromJson(json['division'] as Map<String, dynamic>),
      address: json['address'] as String,
      birthDate: json['birthDate'] as String,
      phoneNumber: json['phoneNumber'] as String,
      sex: json['sex'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'division': instance.division.toJson(),
      'address': instance.address,
      'birthDate': instance.birthDate,
      'phoneNumber': instance.phoneNumber,
      'sex': instance.sex,
    };
