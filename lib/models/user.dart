import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        division: Division.fromJson(json["division"]),
        address: json["address"],
        birthDate: json["birthDate"],
        phoneNumber: json["phoneNumber"],
        sex: json["sex"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "division": division.toJson(),
        "address": address,
        "birthDate": birthDate,
        "phoneNumber": phoneNumber,
        "sex": sex,
      };
}

class Division {
  final String name;

  Division({
    required this.name,
  });

  factory Division.fromJson(Map<String, dynamic> json) => Division(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
