import 'package:flutter_bookstore2/src/Modules/Books/Controller/book_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Repository/book_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Controller/rent_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Repository/rent_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/View/Components/rent_form.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/View/Components/rents_details.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/View/Components/rents_filter.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/View/rents_page.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Controller/user_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Repository/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RentsModlule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => RentController(i())),
        Bind.factory((i) => RentRepository()),
        Bind.singleton((i) => UserController(i())),
        Bind.factory((i) => UserRepository()),
        Bind.singleton((i) => BookController(i())),
        Bind.factory((i) => BookRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: ((context, args) => const RentsPage()),
            transition: TransitionType.noTransition),
        ChildRoute('/details',
            child: (context, args) => RentsDetail(rent: args.data),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 150)),
        ChildRoute('/form',
            child: (context, args) => RentForm(rent: args.data),
            transition: TransitionType.rightToLeft),
        ChildRoute('/filter',
            child: (context, args) => const RentsFilter(),
            transition: TransitionType.downToUp,
            duration: const Duration(milliseconds: 150)),
      ];
}
