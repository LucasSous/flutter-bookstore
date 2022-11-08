import 'package:flutter_bookstore2/src/Modules/Books/Controller/book_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Repository/book_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Books/books_module.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Controller/publisher_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Repository/publisher_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/publishers_module.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Controller/rent_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Repository/rent_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/rents_module.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Controller/user_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Repository/user_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Users/users_module.dart';
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
        ModuleRoute('/users', module: UsersModule()),
        ModuleRoute('/publishers', module: PublishersModule()),
        ModuleRoute('/books', module: BooksModule()),
        ModuleRoute('/rents', module: RentsModlule())
      ];
}
