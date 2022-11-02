import 'dart:convert';

import 'package:flutter_bookstore2/src/Api/api.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Model/book_model.dart';
import 'package:http/http.dart' as http;

class BookRepository {
  Future<List<Book>> getAll() async {
    final response = await http.get(Uri.parse('${Api.baseURL}/livros'));
    final body = (jsonDecode(utf8.decode(response.bodyBytes)) as List);
    final data = body.map((item) => Book.fromJson(item)).toList();
    return data;
  }

  Future<void> save(Book book) async {
    await http.post(Uri.parse('${Api.baseURL}/livro'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          'nome': book.name,
          'autor': book.author,
          'editora': {'id': book.publisher?.id},
          'lancamento': book.launch,
          'quantidade': book.quantity
        }),
        encoding: Encoding.getByName("utf-8"));
  }

  Future<void> update(Book book) async {
    await http.put(Uri.parse('${Api.baseURL}/livro'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          'id': book.id,
          'nome': book.name,
          'autor': book.author,
          'editora': {'id': book.publisher?.id},
          'lancamento': book.launch,
          'quantidade': book.quantity
        }),
        encoding: Encoding.getByName("utf-8"));
  }

  Future<void> delete(Book book) async {
    await http.delete(Uri.parse('${Api.baseURL}/livro'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          'id': book.id,
          'nome': book.name,
          'autor': book.author,
          'editora': {'id': book.publisher?.id},
          'lancamento': book.launch,
          'quantidade': book.quantity
        }),
        encoding: Encoding.getByName("utf-8"));
  }
}
