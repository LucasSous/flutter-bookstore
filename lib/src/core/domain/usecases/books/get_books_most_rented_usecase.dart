import 'package:flutter_bookstore2/src/core/domain/models/book_model.dart';

abstract class GetBooksMostRentedUseCase {
  Future<List<BookModel>> call();
}
