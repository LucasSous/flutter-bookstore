import 'package:flutter_bookstore2/src/core/domain/models/book_model.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/books_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/get_all_books_usecase.dart';

class GetAllBooksUseCaseImp implements GetAllBooksUseCase {
  final BooksRepository _booksRepository;

  GetAllBooksUseCaseImp(this._booksRepository);

  @override
  Future<List<BookModel>> call() async {
    final response = await _booksRepository.getAll();
    response.sort((a, b) => b.id!.compareTo(a.id!));
    return response;
  }
}
