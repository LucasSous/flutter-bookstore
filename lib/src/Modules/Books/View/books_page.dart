import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/add_button.dart';
import 'package:flutter_bookstore2/src/Components/default_app_bar.dart';
import 'package:flutter_bookstore2/src/Components/loading_page.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Controller/book_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Books/View/Components/books_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BooksPage extends StatefulWidget {
  const BooksPage({Key? key}) : super(key: key);

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
  final bookController = Modular.get<BookController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
          title: 'Livros',
          search: () {
            bookController.resetFilter();
            Modular.to.pushNamed('/books/filter');
          },
          border: true),
      body: Observer(builder: (_) {
        if (bookController.loading == true) {
          return const LoadingPage();
        } else if (bookController.books.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Nenhum livro cadastrado'),
          );
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12, bottom: 80, left: 12, right: 12),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: bookController.books.length,
                  itemBuilder: (ctx, i) =>
                      BooksList(book: bookController.books[i])),
            ),
          );
        }
      }),
      floatingActionButton: const AddButton(route: '/books/form'),
    );
  }
}
