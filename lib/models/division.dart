import 'package:json_annotation/json_annotation.dart';

part 'division.g.dart';

@JsonSerializable(explicitToJson: true)
class Division {
  final String name;

  Division({
    required this.name,
  });

  factory Division.fromJson(Map<String, dynamic> json) =>
      _$DivisionFromJson(json);

  Map<String, dynamic> toJson() => _$DivisionToJson(this);
}
