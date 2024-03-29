import 'package:flutter/material.dart';
import 'package:flutter_bookstore2/src/components/button_icon.dart';
import 'package:flutter_bookstore2/src/components/dialog.dart';
import 'package:flutter_bookstore2/src/modules/books/controller/book_controller.dart';
import 'package:flutter_bookstore2/src/core/domain/models/book_model.dart';

import 'package:flutter_modular/flutter_modular.dart';

class BooksList extends StatelessWidget {
  final BookModel book;
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
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              color: Theme.of(context).shadowColor,
              offset: const Offset(0, 0))
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
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '#${book.id}',
                  style: const TextStyle(fontSize: 16),
                ),
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Text(
                    book.name,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 18),
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Editora:'),
                        Text(book.publisher!.name,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        const SizedBox(height: 10),
                        const Text('Autor'),
                        Text(book.author,
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        const SizedBox(height: 10),
                        const Text('Lançamento'),
                        Text(book.launch.toString(),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                            softWrap: false,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16)),
                        const SizedBox(height: 10),
                        const Text('Quantidade'),
                        quantity(book.quantity)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      ButtonIcon(
                        onTap: () {
                          Modular.to.pushNamed('/books/form', arguments: book);
                        },
                        icon: Icons.edit,
                      ),
                      const SizedBox(width: 10),
                      ButtonIcon(
                        onTap: () {
                          openDialog(
                              context: context,
                              title: 'Deletar Livro',
                              message: 'O livro ${book.name} será deletado!',
                              confirm: () {
                                bookController.deleteBook(book);
                                Modular.to.pop();
                              });
                        },
                        icon: Icons.delete,
                        color: const Color(0xFFFF7E7E),
                      ),
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
