import 'package:bcrypt/bcrypt.dart';

class User {
  final int? id;
  final String username;
  final String email;
  final String senha;
  final DateTime data;

  User({
    this.id,
    required this.username,
    required this.email,
    required this.senha,
    required this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'senha': senha,
      'data': data.toIso8601String(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      username: map['username'],
      email: map['mail'],
      senha: map['senha'],
      data: DateTime.parse(map['data']),
    );
  }

  Future<bool> verifyPassword(String senha) async {
    return BCrypt.checkpw(senha, this.senha);
  }
}