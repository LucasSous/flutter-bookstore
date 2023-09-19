// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_bookstore2/src/components/snack_bar.dart';
import 'package:flutter_bookstore2/src/core/domain/models/book_model.dart';
import 'package:flutter_bookstore2/src/core/domain/models/publisher_model.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/delete_book_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/get_all_books_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/save_book_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/update_book_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/publishers/get_all_publishers_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'book_controller.g.dart';

class BookController = _BookControllerBase with _$BookController;

abstract class _BookControllerBase with Store {
  final GetAllBooksUseCase _getAllBooksUseCase;
  final SaveBookUseCase _saveBookUseCase;
  final UpdateBookUseCase _updateBookUseCase;
  final DeleteBookUseCase _deleteBookUseCase;
  final GetAllPublishersUseCase _getAllPublishersUseCase;

  _BookControllerBase(
    this._getAllBooksUseCase,
    this._saveBookUseCase,
    this._updateBookUseCase,
    this._deleteBookUseCase,
    this._getAllPublishersUseCase,
  ) {
    getAllBooks();
    getAllPublishers();
  }

  @observable
  List<BookModel> books = [];

  @observable
  List<BookModel> booksFilter = [];

  @observable
  List<PublisherModel> publishers = [];

  @observable
  bool isEmptyInput = true;

  @observable
  bool loading = false;

  @action
  Future<void> getAllBooks() async {
    loading = true;
    try {
      final response = await _getAllBooksUseCase();
      books = response;
    } catch (e) {
      showSnackBar('Erro ao tentar listar livros', Status.error);
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> createBook(BookModel book) async {
    try {
      loading = true;
      await _saveBookUseCase(book);
      showSnackBar('Livro cadastrado com sucesso', Status.success);
      await getAllBooks();
      Modular.to.pop();
      loading = false;
    } catch (e) {
      showSnackBar(e.toString(), Status.error);
    }
  }

  @action
  Future<void> updateBook(BookModel book) async {
    if (book.id != null) {
      try {
        loading = true;
        await _updateBookUseCase(book);
        showSnackBar('Livro editado com sucesso', Status.success);
        Modular.to.pop();
        await getAllBooks();
        loading = false;
      } catch (e) {
        showSnackBar(e.toString(), Status.error);
      }
    }
  }

  @action
  Future<void> deleteBook(BookModel book) async {
    try {
      await _deleteBookUseCase(book);
      showSnackBar('Livro deletado com sucesso', Status.success);
      Modular.to.navigate('/books/');
      await getAllBooks();
    } catch (e) {
      showSnackBar(e.toString(), Status.error);
    }
  }

  @action
  Future<void> getAllPublishers() async {
    loading = true;
    try {
      final response = await _getAllPublishersUseCase();
      publishers = response;
    } catch (e) {
      showSnackBar('Erro ao tentar listar editoras', Status.error);
    } finally {
      loading = false;
    }
  }

  @action
  void filter(String value) {
    if (value.isEmpty) {
      booksFilter = [];
      isEmptyInput = true;
      return;
    } else {
      isEmptyInput = false;
    }

    List<BookModel> list = books
        .where((e) =>
            e.id.toString().toLowerCase().contains(
                  value.toString(),
                ) ||
            e.name.toString().toLowerCase().contains(
                  (value.toLowerCase()),
                ) ||
            e.author.toString().toLowerCase().contains(
                  (value.toLowerCase()),
                ) ||
            e.publisher!.name.toString().toLowerCase().contains(
                  (value.toLowerCase()),
                ) ||
            e.launch.toString().toLowerCase().contains(
                  (value.toString()),
                ) ||
            e.quantity.toString().toLowerCase().contains(
                  (value.toString()),
                ))
        .toList();

    booksFilter = list;
  }

  @action
  void resetFilter() {
    booksFilter = [];
    isEmptyInput = true;
  }
}
