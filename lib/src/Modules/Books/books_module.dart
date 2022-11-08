import 'package:flutter_bookstore2/src/Modules/Books/View/book_form.dart';
import 'package:flutter_bookstore2/src/Modules/Books/View/books_filter.dart';
import 'package:flutter_bookstore2/src/Modules/Books/View/books_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class BooksModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: ((context, args) => const BooksPage())),
        ChildRoute('/form',
            child: (context, args) => BookForm(book: args.data),
            transition: TransitionType.rightToLeft),
        ChildRoute('/filter',
            child: (context, args) => const BooksFilter(),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 150)),
      ];
}
