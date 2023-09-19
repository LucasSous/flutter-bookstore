import 'dart:convert';

import 'package:flutter_bookstore2/src/core/domain/models/book_model.dart';
import 'package:flutter_bookstore2/src/core/errors/response_error.dart';
import 'package:flutter_bookstore2/src/core/infra/datasourses/books_datasourse.dart';
import 'package:flutter_bookstore2/src/api/api.dart';
import 'package:flutter_bookstore2/src/core/infra/dto/book_dto.dart';
import 'package:http/http.dart' as http;

class BooksDataSourseHttpImp implements BooksDataSourse {
  final _url = '${Api.baseURL}/livro';
  final _headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  };
  final _encoding = Encoding.getByName("utf-8");

  @override
  Future<List<BookModel>> getAll() async {
    final response = await http.get(Uri.parse('${Api.baseURL}/livros'));
    if (response.statusCode == 200) {
      final body = (jsonDecode(utf8.decode(response.bodyBytes)) as List);
      final data = body.map((item) => BookDto.fromJson(item)).toList();
      return data;
    }
    return List.empty();
  }

  @override
  Future<List<BookModel>> getMostRented() async {
    final response = await http.get(Uri.parse('${Api.baseURL}/maisalugados'));
    if (response.statusCode == 200) {
      final body = (jsonDecode(utf8.decode(response.bodyBytes)) as List);
      final data = body.map((item) => BookDto.fromJson(item)).toList();
      return data;
    }
    return List.empty();
  }

  @override
  Future<void> save(BookModel book) async {
    final response = await http.post(
      Uri.parse(_url),
      headers: _headers,
      body: jsonEncode(BookDto.toJson(book)),
      encoding: _encoding,
    );

    if (response.statusCode != 200) {
      var body = jsonDecode(utf8.decode(response.bodyBytes));
      throw ResponseError(body);
    }
  }

  @override
  Future<void> update(BookModel book) async {
    final response = await http.put(
      Uri.parse(_url),
      headers: _headers,
      body: jsonEncode(BookDto.toJson(book)),
      encoding: _encoding,
    );

    if (response.statusCode != 200) {
      var body = jsonDecode(utf8.decode(response.bodyBytes));
      throw ResponseError(body);
    }
  }

  @override
  Future<void> delete(BookModel book) async {
    final response = await http.delete(
      Uri.parse(_url),
      headers: _headers,
      body: jsonEncode(BookDto.toJson(book)),
      encoding: _encoding,
    );

    if (response.statusCode != 200) {
      var body = jsonDecode(utf8.decode(response.bodyBytes));
      throw ResponseError(body);
    }
  }
}
