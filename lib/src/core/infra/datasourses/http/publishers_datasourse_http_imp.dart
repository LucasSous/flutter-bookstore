import 'package:flutter_bookstore2/src/core/domain/models/publisher_model.dart';
import 'dart:convert';

import 'package:flutter_bookstore2/src/api/api.dart';
import 'package:flutter_bookstore2/src/core/infra/datasourses/publishers_datasourse.dart';
import 'package:flutter_bookstore2/src/core/infra/dto/publisher_dto.dart';
import 'package:http/http.dart' as http;

class PublishersDataSourseHttpImp implements PublishersDataSourse {
  final _url = '${Api.baseURL}/editora';
  final _headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  };
  final _encoding = Encoding.getByName("utf-8");

  @override
  Future<List<PublisherModel>> getAll() async {
    final response = await http.get(Uri.parse('${Api.baseURL}/editoras'));
    if (response.statusCode == 200) {
      final body = (jsonDecode(utf8.decode(response.bodyBytes)) as List);
      final data = body.map((item) => PublisherDto.fromJson(item)).toList();
      return data;
    }
    return List.empty();
  }

  @override
  Future<void> save(PublisherModel publisher) async {
    final response = await http.post(
      Uri.parse(_url),
      headers: _headers,
      body: jsonEncode(PublisherDto.toJson(publisher)),
      encoding: _encoding,
    );

    if (response.statusCode != 200) {
      throw Exception(response.body.toString());
    }
  }

  @override
  Future<void> update(PublisherModel publisher) async {
    final response = await http.put(
      Uri.parse(_url),
      headers: _headers,
      body: jsonEncode(PublisherDto.toJson(publisher)),
      encoding: _encoding,
    );

    if (response.statusCode != 200) {
      throw Exception(response.body.toString());
    }
  }

  @override
  Future<void> delete(PublisherModel publisher) async {
    final response = await http.delete(
      Uri.parse(_url),
      headers: _headers,
      body: jsonEncode(PublisherDto.toJson(publisher)),
      encoding: _encoding,
    );

    if (response.statusCode != 200) {
      throw Exception(response.body.toString());
    }
  }
}
