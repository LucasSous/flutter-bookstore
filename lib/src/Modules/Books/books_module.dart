import 'package:flutter_bookstore2/src/Modules/Books/Controller/book_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Repository/book_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Books/View/book_form.dart';
import 'package:flutter_bookstore2/src/Modules/Books/View/books_filter.dart';
import 'package:flutter_bookstore2/src/Modules/Books/View/books_page.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Controller/publisher_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Repository/publisher_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BooksModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => BookController(i())),
        Bind.factory((i) => BookRepository()),
        Bind.singleton((i) => PublisherController(i())),
        Bind.factory((i) => PublisherRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: ((context, args) => const BooksPage()),
            transition: TransitionType.noTransition),
        ChildRoute('/form',
            child: (context, args) => BookForm(book: args.data),
            transition: TransitionType.rightToLeft),
        ChildRoute('/filter',
            child: (context, args) => const BooksFilter(),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 150)),
      ];
}
