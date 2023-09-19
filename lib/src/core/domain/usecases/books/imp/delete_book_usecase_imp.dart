import 'package:flutter_bookstore2/src/core/domain/models/book_model.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/books_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/delete_book_usecase.dart';
import 'package:flutter_bookstore2/src/core/errors/response_error.dart';

class DeleteBookUseCaseImp implements DeleteBookUseCase {
  final BooksRepository _booksRepository;

  DeleteBookUseCaseImp(this._booksRepository);

  @override
  Future<void> call(BookModel book) async {
    try {
      await _booksRepository.delete(book);
    } catch (e) {
      if (e is ResponseError) {
        if (e.error['status'] == 400) {
          throw Exception(e.error['error']);
        } else {
          throw Exception('Erro ao tentar deletar livro');
        }
      }
    }
  }
}
