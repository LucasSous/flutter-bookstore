import 'package:flutter_bookstore2/src/Modules/Books/Controller/book_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Repository/book_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Books/View/book_form.dart';
import 'package:flutter_bookstore2/src/Modules/Books/View/books_filter.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Controller/publisher_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Repository/publisher_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/View/publisher_form.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/View/publishers_filter.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Controller/rent_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Repository/rent_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Controller/user_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Repository/user_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Users/View/user_form.dart';
import 'package:flutter_bookstore2/src/Modules/Users/View/users_filter.dart';
import 'package:flutter_bookstore2/src/start_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModlule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => UserController(i())),
        Bind.factory((i) => UserRepository()),
        Bind.singleton((i) => PublisherController(i())),
        Bind.factory((i) => PublisherRepository()),
        Bind.singleton((i) => BookController(i())),
        Bind.factory((i) => BookRepository()),
        Bind.singleton((i) => RentController(i())),
        Bind.factory((i) => RentRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const StartPage()),
        ChildRoute('/user_form',
            child: (context, args) => UserForm(user: args.data)),
        ChildRoute('/users_filter',
            child: (context, args) => const UsersFilter()),
        ChildRoute('/publisher_form',
            child: (context, args) => PublisherForm(publisher: args.data)),
        ChildRoute('/publishers_filter',
            child: (context, args) => const PublishersFilter()),
        ChildRoute('/book_form',
            child: (context, args) => BookForm(book: args.data)),
        ChildRoute('/books_filter',
            child: (context, args) => const BooksFilter()),
      ];
}
