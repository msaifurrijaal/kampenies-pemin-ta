import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:kampenies/models/division.dart';
part 'user.g.dart';

List<User> userFromJson(List<dynamic> list) =>
    List<User>.from(list.map((itemUser) => User.fromJson(itemUser)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable(explicitToJson: true)
class User {
  final int id;
  final String email;
  final String name;
  final Division division;
  final String address;
  final String birthDate;
  final String phoneNumber;
  final String sex;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.division,
    required this.address,
    required this.birthDate,
    required this.phoneNumber,
    required this.sex,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
