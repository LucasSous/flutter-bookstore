import 'dart:convert';

import 'package:flutter_bookstore2/src/core/domain/models/user_model.dart';
import 'package:flutter_bookstore2/src/core/errors/response_error.dart';
import 'package:flutter_bookstore2/src/api/api.dart';
import 'package:flutter_bookstore2/src/core/infra/datasourses/users_datasourse.dart';
import 'package:flutter_bookstore2/src/core/infra/dto/user_dto.dart';
import 'package:http/http.dart' as http;

class UsersDataSourseHttpImp implements UsersDataSourse {
  final _url = '${Api.baseURL}/usuario';
  final _headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  };
  final _encoding = Encoding.getByName("utf-8");

  @override
  Future<List<UserModel>> getAll() async {
    final response = await http.get(Uri.parse('${Api.baseURL}/usuarios'));
    if (response.statusCode == 200) {
      final body = (jsonDecode(utf8.decode(response.bodyBytes)) as List);
      final data = body.map((item) => UserDto.fromJson(item)).toList();
      return data;
    }
    return List.empty();
  }

  @override
  Future<void> save(UserModel user) async {
    final response = await http.post(
      Uri.parse(_url),
      headers: _headers,
      body: jsonEncode(UserDto.toJson(user)),
      encoding: _encoding,
    );

    if (response.statusCode != 200) {
      var body = jsonDecode(utf8.decode(response.bodyBytes));
      throw ResponseError(body);
    }
  }

  @override
  Future<void> update(UserModel user) async {
    final response = await http.put(
      Uri.parse(_url),
      headers: _headers,
      body: jsonEncode(UserDto.toJson(user)),
      encoding: _encoding,
    );

    if (response.statusCode != 200) {
      var body = jsonDecode(utf8.decode(response.bodyBytes));
      throw ResponseError(body);
    }
  }

  @override
  Future<void> delete(UserModel user) async {
    final response = await http.delete(
      Uri.parse(_url),
      headers: _headers,
      body: jsonEncode(UserDto.toJson(user)),
      encoding: _encoding,
    );

    if (response.statusCode != 200) {
      var body = jsonDecode(utf8.decode(response.bodyBytes));
      throw ResponseError(body);
    }
  }
}
