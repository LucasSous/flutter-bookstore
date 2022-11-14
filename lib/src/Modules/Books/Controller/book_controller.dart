// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_bookstore2/src/Components/snack_bar.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Model/book_model.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Repository/book_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'book_controller.g.dart';

class BookController = _BookControllerBase with _$BookController;

abstract class _BookControllerBase with Store {
  final BookRepository bookRepo;

  _BookControllerBase(this.bookRepo) {
    getAllBooks();
  }

  @observable
  List<Book> books = [];

  @observable
  List<Book> booksFilter = [];

  @observable
  bool isEmptyInput = true;

  @observable
  bool loading = false;

  @action
  getAllBooks() async {
    loading = true;
    try {
      final response = await bookRepo.getAll();
      response.sort((a, b) => b.id.compareTo(a.id));
      books = response;
    } catch (e) {
      showSnackBar('Erro ao tentar listar livros', 'error');
    } finally {
      loading = false;
    }
  }

  @action
  createBook(Book book) async {
    // ignore: unnecessary_null_comparison
    if (book != null) {
      loading = true;
      try {
        await bookRepo.save(book);
        showSnackBar('Livro cadastrado com sucesso', 'success');
        await getAllBooks();
        Modular.to.pop();
      } catch (e) {
        showSnackBar('Erro ao tentar cadastar livro', 'error');
      } finally {
        loading = false;
      }
    }
  }

  @action
  updateBook(Book book) async {
    // ignore: unnecessary_null_comparison
    if (book != null && book.id != null) {
      loading = true;
      try {
        await bookRepo.update(book);
        showSnackBar('Livro editado com sucesso', 'success');
        Modular.to.pop();
      } catch (e) {
        showSnackBar('Erro ao tentar editar livro', 'error');
      } finally {
        await getAllBooks();
        loading = false;
      }
    }
  }

  @action
  deleteBook(Book book) async {
    // ignore: unnecessary_null_comparison
    if (book != null) {
      try {
        await bookRepo.delete(book);
        showSnackBar('Livro deletado com sucesso', 'success');
        Modular.to.navigate('/books/');
      } catch (e) {
        showSnackBar('Não é possivel deletar este livro', 'error');
      } finally {
        await getAllBooks();
      }
    }
  }

  @action
  filter(String value) async {
    if (value.isEmpty) {
      booksFilter = [];
      isEmptyInput = true;
      return;
    } else {
      isEmptyInput = false;
    }

    List<Book> list = books
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
  resetFilter() {
    booksFilter = [];
    isEmptyInput = true;
  }
}
