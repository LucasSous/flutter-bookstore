import 'dart:convert';

import 'package:flutter_bookstore2/src/Api/api.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Model/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<User>> getAll() async {
    final response = await http.get(Uri.parse('${Api.baseURL}/usuarios'));
    final body = (jsonDecode(utf8.decode(response.bodyBytes)) as List);
    final data = body.map((item) => User.fromJson(item)).toList();
    return data;
  }

  Future<void> save(User user) async {
    await http.post(Uri.parse('${Api.baseURL}/usuario'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          'nome': user.name,
          'endereco': user.address,
          'cidade': user.city,
          'email': user.email
        }),
        encoding: Encoding.getByName("utf-8"));
  }

  Future<void> update(User user) async {
    final response = await http.put(Uri.parse('${Api.baseURL}/usuario'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          'id': user.id,
          'nome': user.name,
          'endereco': user.address,
          'cidade': user.city,
          'email': user.email
        }),
        encoding: Encoding.getByName("utf-8"));

    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> delete(User user) async {
    final response = await http.delete(Uri.parse('${Api.baseURL}/usuario'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          'id': user.id,
          'nome': user.name,
          'endereco': user.address,
          'cidade': user.city,
          'email': user.email
        }),
        encoding: Encoding.getByName("utf-8"));

    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
