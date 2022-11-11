import 'package:flutter_bookstore2/src/Components/menu_page.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Repository/book_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Books/books_module.dart';
import 'package:flutter_bookstore2/src/Modules/Home/Controller/home_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Home/View/home_page.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Repository/publisher_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/publishers_module.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Repository/rent_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/rents_module.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Repository/user_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Users/users_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModlule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => HomeController(i(), i(), i(), i())),
        Bind.factory((i) => RentRepository()),
        Bind.factory((i) => PublisherRepository()),
        Bind.factory((i) => BookRepository()),
        Bind.factory((i) => UserRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const HomePage(),
            transition: TransitionType.noTransition),
        ChildRoute('/menu',
            child: ((context, args) => const MenuPage()),
            transition: TransitionType.leftToRight),
        ModuleRoute('/users', module: UsersModule()),
        ModuleRoute('/publishers', module: PublishersModule()),
        ModuleRoute('/books', module: BooksModule()),
        ModuleRoute('/rents', module: RentsModlule())
      ];
}
