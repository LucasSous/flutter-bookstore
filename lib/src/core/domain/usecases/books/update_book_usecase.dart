import 'package:flutter_bookstore2/src/core/domain/models/book_model.dart';

abstract class UpdateBookUseCase {
  Future<void> call(BookModel book);
}
