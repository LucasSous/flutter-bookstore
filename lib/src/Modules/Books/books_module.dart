import 'package:flutter_bookstore2/src/modules/books/controller/book_controller.dart';
import 'package:flutter_bookstore2/src/modules/books/view/book_form.dart';
import 'package:flutter_bookstore2/src/modules/books/view/books_filter.dart';
import 'package:flutter_bookstore2/src/modules/books/view/books_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BooksModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => BookController(i(), i(), i(), i(), i())),
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
