import 'package:flutter_bookstore2/src/core/domain/models/book_model.dart';

abstract class BooksDataSourse {
  Future<List<BookModel>> getAll();
  Future<List<BookModel>> getMostRented();
  Future<void> save(BookModel book);
  Future<void> update(BookModel book);
  Future<void> delete(BookModel book);
}
