import 'package:flutter_bookstore2/src/core/domain/models/book_model.dart';

abstract class GetAllBooksUseCase {
  Future<List<BookModel>> call();
}
