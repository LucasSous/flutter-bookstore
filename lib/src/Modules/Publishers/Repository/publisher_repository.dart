import 'dart:convert';

import 'package:flutter_bookstore2/src/Api/api.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Model/publisher_model.dart';
import 'package:http/http.dart' as http;

class PublisherRepository {
  Future<List<Publisher>> getAll() async {
    final response = await http.get(Uri.parse('${Api.baseURL}/editoras'));
    final body = (jsonDecode(utf8.decode(response.bodyBytes)) as List);
    final data = body.map((item) => Publisher.fromJson(item)).toList();
    return data;
  }

  Future<void> save(Publisher publisher) async {
    await http.post(Uri.parse('${Api.baseURL}/editora'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          'nome': publisher.name,
          'cidade': publisher.city,
        }),
        encoding: Encoding.getByName("utf-8"));
  }

  Future<void> update(Publisher publisher) async {
    final response = await http.put(Uri.parse('${Api.baseURL}/editora'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          'id': publisher.id,
          'nome': publisher.name,
          'cidade': publisher.city,
        }),
        encoding: Encoding.getByName("utf-8"));

    if (response.statusCode != 200) {
      throw Exception();
    }
  }

  Future<void> delete(Publisher publisher) async {
    final response = await http.delete(Uri.parse('${Api.baseURL}/editora'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          'id': publisher.id,
          'nome': publisher.name,
          'cidade': publisher.city,
        }),
        encoding: Encoding.getByName("utf-8"));

    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
