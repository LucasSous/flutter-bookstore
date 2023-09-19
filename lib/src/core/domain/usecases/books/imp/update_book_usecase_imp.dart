import 'package:flutter_bookstore2/src/core/domain/models/book_model.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/books_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/update_book_usecase.dart';
import 'package:flutter_bookstore2/src/core/errors/response_error.dart';

class UpdateBookUseCaseImp implements UpdateBookUseCase {
  final BooksRepository _booksRepository;

  UpdateBookUseCaseImp(this._booksRepository);

  @override
  Future<void> call(BookModel book) async {
    try {
      await _booksRepository.update(book);
    } catch (e) {
      if (e is ResponseError) {
        if (e.error['status'] == 400) {
          throw Exception(e.error['error']);
        } else {
          throw Exception('Erro ao tentar editar livro');
        }
      }
    }
  }
}
