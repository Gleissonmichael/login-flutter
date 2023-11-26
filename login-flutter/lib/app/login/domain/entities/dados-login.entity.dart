// coverage:ignore-file
import 'package:equatable/equatable.dart';

class DadosLogin extends Equatable {
  final String username;
  final String password;

  const DadosLogin({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [username, password];
}
