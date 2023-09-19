import 'package:flutter_bookstore2/src/core/domain/models/book_model.dart';

abstract class SaveBookUseCase {
  Future<void> call(BookModel book);
}
