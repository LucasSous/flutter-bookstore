import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/app_bar_filter.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Controller/book_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Books/View/Components/books_list.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BooksFilter extends StatelessWidget {
  const BooksFilter({Key? key}) : super(key: key);

  returns(BookController book) {
    if (book.isEmptyInput) {
      return Container();
    } else if (!book.isEmptyInput && book.booksFilter.isEmpty) {
      return Text('Nenhum reultado encontrado',
          style: TextStyle(color: Colors.grey.shade600));
    } else {
      return SingleChildScrollView(
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: book.booksFilter.length,
            itemBuilder: (ctx, i) => BooksList(book: book.booksFilter[i])),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookController = Modular.get<BookController>();
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBarFilter(
            onChanged: (text) => bookController.filter(text.toString())),
        body: Padding(
            padding: const EdgeInsets.all(8.0), child: returns(bookController)),
      );
    });
  }
}
