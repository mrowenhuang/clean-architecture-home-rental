import 'dart:convert';

import 'package:clean_architecture_rental_room/features/auth/domain/entities/user_entities.dart';

class UserModels extends UserEntities {
  UserModels({super.id, super.username, super.email, super.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'password': password,
    };
  }

  factory UserModels.fromMap(Map<String, dynamic> map) {
    return UserModels(
      id: map['id'] != null ? map['id'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
    );
  }

  factory UserModels.fromEntity(UserEntities entity) {
    return UserModels(
      id: entity.id,
      username: entity.username,
      email: entity.email,
      password: entity.password,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModels.fromJson(String source) =>
      UserModels.fromMap(json.decode(source) as Map<String, dynamic>);
}
