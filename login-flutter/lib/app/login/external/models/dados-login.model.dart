// coverage:ignore-file
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dados-login.model.g.dart';

@JsonSerializable()
class DadosLoginModel extends Equatable {
  final String username;
  final String password;

  const DadosLoginModel({
    required this.username,
    required this.password,
  });

  factory DadosLoginModel.fromJson(Map<String, dynamic> json) => _$DadosLoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$DadosLoginModelToJson(this);

  @override
  List<Object?> get props => [username, password];
}
