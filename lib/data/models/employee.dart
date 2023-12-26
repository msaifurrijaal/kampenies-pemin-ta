// To parse this JSON data, do
//
//     final employee = employeeFromJson(jsonString);
import 'dart:convert';

List<Employee> employeeFromJson(String str) =>
    List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
  final String name;
  final String avatar;
  final String role;
  final String deskripsi;
  final int usia;
  final String divisi;
  final String id;

  Employee({
    required this.name,
    required this.avatar,
    required this.role,
    required this.deskripsi,
    required this.usia,
    required this.divisi,
    required this.id,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        name: json["name"],
        avatar: json["avatar"],
        role: json["role"],
        deskripsi: json["deskripsi"],
        usia: json["usia"],
        divisi: json["divisi"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "avatar": avatar,
        "role": role,
        "deskripsi": deskripsi,
        "usia": usia,
        "divisi": divisi,
        "id": id,
      };
}
