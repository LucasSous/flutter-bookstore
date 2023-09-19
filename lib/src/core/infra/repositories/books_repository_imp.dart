import 'package:flutter_bookstore2/src/core/domain/models/book_model.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/books_repository.dart';
import 'package:flutter_bookstore2/src/core/infra/datasourses/books_datasourse.dart';

class BooksRepositoryImp implements BooksRepository {
  final BooksDataSourse _booksDataSourse;

  BooksRepositoryImp(this._booksDataSourse);

  @override
  Future<List<BookModel>> getAll() async {
    return await _booksDataSourse.getAll();
  }

  @override
  Future<List<BookModel>> getMostRented() async {
    return await _booksDataSourse.getMostRented();
  }

  @override
  Future<void> save(BookModel book) async {
    await _booksDataSourse.save(book);
  }

  @override
  Future<void> update(BookModel book) async {
    await _booksDataSourse.update(book);
  }

  @override
  Future<void> delete(BookModel book) async {
    await _booksDataSourse.delete(book);
  }
}
