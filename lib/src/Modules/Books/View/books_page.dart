import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/default_title.dart';
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
  @override
  Widget build(BuildContext context) {
    final bookController = Modular.get<BookController>();
    return Observer(
        name: 'observerPublisherPage',
        builder: (_) {
          if (bookController.loading == true) {
            return const LoadingPage();
          } else {
            return Scaffold(
                backgroundColor: Theme.of(context).backgroundColor,
                body: NestedScrollView(
                  floatHeaderSlivers: true,
                  headerSliverBuilder: (context, __) => [
                    SliverAppBar(
                      snap: true,
                      floating: true,
                      title: const DefaultTitle(text: 'Livros'),
                      elevation: 1.0,
                      backgroundColor: Colors.white,
                      shape: Border(
                        bottom: BorderSide(
                            width: 1,
                            color: Colors.grey.shade500,
                            style: BorderStyle.solid),
                      ),
                      actions: <Widget>[
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  bookController.resetFilter();
                                  Modular.to.pushNamed('/books_filter');
                                },
                                icon: const Icon(Icons.search),
                                color: Colors.black),
                            IconButton(
                                onPressed: () {
                                  Modular.to.pushNamed('/book_form');
                                },
                                icon: const Icon(Icons.add),
                                color: Colors.black)
                          ],
                        )
                      ],
                    )
                  ],
                  body: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: bookController.books.length,
                          itemBuilder: (ctx, i) =>
                              BooksList(book: bookController.books[i])),
                    ),
                  ),
                ));
          }
        });
  }
}
