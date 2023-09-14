import 'package:flutter_bookstore2/src/Components/menu_page.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Controller/book_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Repository/book_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Books/books_module.dart';
import 'package:flutter_bookstore2/src/Modules/Home/Controller/home_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Home/View/home_page.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Controller/publisher_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/publishers_module.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Controller/rent_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Repository/rent_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/rents_module.dart';
import 'package:flutter_bookstore2/src/Modules/SplashScreen/view/splash_screen.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Repository/user_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Users/users_module.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Controller/user_controller.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/publishers_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/useCases/imp/publishers_usecase_imp.dart';
import 'package:flutter_bookstore2/src/core/domain/useCases/publishers_usecase.dart';
import 'package:flutter_bookstore2/src/core/infra/datasourses/http/publishers_datasourse_http_imp.dart';
import 'package:flutter_bookstore2/src/core/infra/datasourses/publishers_datasourse.dart';
import 'package:flutter_bookstore2/src/core/infra/repositories/publishers_repository_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModlule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((i) => HomeController()),
        Bind.singleton((i) => UserRepository()),
        Bind.singleton((i) => UserController(i())),
        Bind.singleton((i) => BookController(i())),
        Bind.singleton((i) => BookRepository()),
        Bind.singleton((i) => RentController(i())),
        Bind.singleton((i) => RentRepository()),
        Bind<PublishersDataSourse>((i) => PublishersDataSourseHttpImp()),
        Bind<PublishersRepository>((i) => PublishersRepositoryImp(i())),
        Bind<PublishersUseCase>((i) => PublishersUseCaseImp(i())),
        Bind((i) => PublisherController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => const SplashScreen(),
            transition: TransitionType.noTransition),
        ChildRoute('/home',
            child: ((context, args) => const HomePage()),
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
