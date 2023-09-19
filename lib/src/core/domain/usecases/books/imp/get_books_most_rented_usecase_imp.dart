import 'package:flutter_bookstore2/src/core/domain/models/book_model.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/books_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/get_books_most_rented_usecase.dart';

class GetBooksMostRentedUseCaseImp implements GetBooksMostRentedUseCase {
  final BooksRepository _booksRepository;

  GetBooksMostRentedUseCaseImp(this._booksRepository);

  @override
  Future<List<BookModel>> call() async {
    final response = await _booksRepository.getMostRented();
    return response;
  }
}
