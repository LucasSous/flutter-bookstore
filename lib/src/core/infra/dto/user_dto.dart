import 'package:flutter_bookstore2/src/core/domain/models/user_model.dart';

class UserDto extends UserModel {
  UserDto({
    required super.id,
    required super.name,
    required super.address,
    required super.city,
    required super.email,
  });

  static UserDto fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
      name: json['nome'],
      address: json['endereco'],
      city: json['cidade'],
      email: json['email'],
    );
  }

  static Map<String, dynamic> toJson(UserModel user) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = user.id;
    data['nome'] = user.name;
    data['endereco'] = user.address;
    data['cidade'] = user.city;
    data['email'] = user.email;
    return data;
  }
}
