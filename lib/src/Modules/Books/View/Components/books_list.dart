import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/Components/dialog.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Controller/book_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Model/book_model.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Model/publisher_model.dart';

import 'package:flutter_modular/flutter_modular.dart';

class BooksList extends StatelessWidget {
  final Book book;
  const BooksList({
    Key? key,
    required this.book,
  }) : super(key: key);

  quantity(int quantity) {
    if (quantity == 0) {
      return const Text(
        'Quantidade indisponível',
        overflow: TextOverflow.fade,
        maxLines: 1,
        softWrap: false,
        style: TextStyle(color: Colors.red, fontSize: 16),
      );
    } else {
      return Text(quantity.toString(),
          overflow: TextOverflow.fade,
          maxLines: 1,
          softWrap: false,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16));
    }
  }

  @override
  Widget build(BuildContext context) {
    final bookController = Modular.get<BookController>();
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            spreadRadius: 0.1,
            blurRadius: 4,
            color: Colors.black26,
          )
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          left: BorderSide(
              width: 2,
              color: Theme.of(context).primaryColor,
              style: BorderStyle.solid),
        )),
        child: ExpansionTile(
          iconColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#${book.id}',
                  style: TextStyle(color: Colors.grey.shade500, fontSize: 16),
                ),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Text(
                    book.name,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                )
              ],
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(9.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Editora:'),
                        Text(book.publisher?.name,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        const Text('Autor'),
                        Text(book.author,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        const Text('Lançamento'),
                        Text(book.launch.toString(),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        const Text('Quantidade'),
                        quantity(book.quantity)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Modular.to
                                .pushNamed('/books/form', arguments: book);
                          },
                          icon: const Icon(Icons.edit,
                              size: 18, color: Colors.grey)),
                      IconButton(
                          onPressed: () {
                            openDialog(
                                context: context,
                                title: 'Deletar Livro',
                                message: 'O livro ${book.name} será deletado!',
                                confirm: () {
                                  bookController.deleteBook(Book(
                                    id: book.id,
                                    name: book.name,
                                    author: book.author,
                                    publisher: Publisher(
                                        id: book.publisher?.id,
                                        name: '',
                                        city: ''),
                                    launch: book.launch,
                                    quantity: book.quantity,
                                  ));
                                  Modular.to.pop();
                                });
                          },
                          icon: const Icon(Icons.delete,
                              size: 18, color: Colors.grey))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
