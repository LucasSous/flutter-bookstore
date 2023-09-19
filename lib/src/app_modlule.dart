import 'package:flutter_bookstore2/src/components/menu_page.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/delete_book_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/get_all_books_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/get_books_most_rented_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/imp/delete_book_usecase_imp.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/imp/get_all_books_usecase_imp.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/imp/get_books_most_rented_usecase_imp.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/imp/save_book_usecase_imp.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/imp/update_book_usecase_imp.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/save_book_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/update_book_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/publishers/delete_publisher_usercase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/publishers/get_all_publishers_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/publishers/imp/delete_publisher_usecase_imp.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/publishers/imp/get_all_publishers_usecase_imp.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/publishers/imp/save_publisher_usecase_imp.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/publishers/imp/update_publisher_usecase_imp.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/publishers/save_publisher_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/publishers/update_publisher_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/rents/delete_rent_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/rents/get_all_rents_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/rents/imp/delete_rent_usecase_imp.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/rents/imp/get_all_rents_usecase_imp.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/rents/imp/save_rent_usecase_imp.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/rents/imp/update_rent_usecase_imp.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/rents/save_rent_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/rents/update_rent_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/users/delete_user_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/users/get_all_users_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/users/imp/delete_user_usecase_imp.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/users/imp/get_all_users_usecase_imp.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/users/imp/save_user_usecase_imp.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/users/imp/update_user_usecase_imp.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/users/save_user_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/users/update_user_usecase.dart';
import 'package:flutter_bookstore2/src/modules/books/books_module.dart';
import 'package:flutter_bookstore2/src/modules/home/controller/home_controller.dart';
import 'package:flutter_bookstore2/src/modules/home/view/home_page.dart';
import 'package:flutter_bookstore2/src/modules/publishers/publishers_module.dart';
import 'package:flutter_bookstore2/src/modules/rents/rents_module.dart';
import 'package:flutter_bookstore2/src/modules/splash_screen/view/splash_screen.dart';
import 'package:flutter_bookstore2/src/modules/users/users_module.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/books_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/publishers_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/rents_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/users_repository.dart';
import 'package:flutter_bookstore2/src/core/infra/datasourses/books_datasourse.dart';
import 'package:flutter_bookstore2/src/core/infra/datasourses/http/books_datasourse_http_imp.dart';
import 'package:flutter_bookstore2/src/core/infra/datasourses/http/publishers_datasourse_http_imp.dart';
import 'package:flutter_bookstore2/src/core/infra/datasourses/http/rents_datasourse_http_imp.dart';
import 'package:flutter_bookstore2/src/core/infra/datasourses/http/users_datasourse_http_imp.dart';
import 'package:flutter_bookstore2/src/core/infra/datasourses/publishers_datasourse.dart';
import 'package:flutter_bookstore2/src/core/infra/datasourses/rents_datasourse.dart';
import 'package:flutter_bookstore2/src/core/infra/datasourses/users_datasourse.dart';
import 'package:flutter_bookstore2/src/core/infra/repositories/books_repository_imp.dart';
import 'package:flutter_bookstore2/src/core/infra/repositories/publishers_repository_imp.dart';
import 'package:flutter_bookstore2/src/core/infra/repositories/rents_repository_imp.dart';
import 'package:flutter_bookstore2/src/core/infra/repositories/users_repository_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModlule extends Module {
  @override
  List<Bind> get binds => [
        Bind<UsersDataSourse>((i) => UsersDataSourseHttpImp()),
        Bind<BooksDataSourse>((i) => BooksDataSourseHttpImp()),
        Bind<PublishersDataSourse>((i) => PublishersDataSourseHttpImp()),
        Bind<RentsDataSourse>((i) => RentsDataSourseHttpImp()),
        Bind<UsersRepository>((i) => UsersRepositoryImp(i())),
        Bind<BooksRepository>((i) => BooksRepositoryImp(i())),
        Bind<PublishersRepository>((i) => PublishersRepositoryImp(i())),
        Bind<RentsRepository>((i) => RentsRepositoryImp(i())),
        Bind<GetAllUsersUseCase>((i) => GetAllUsersUseCaseImp(i())),
        Bind<SaveUserUseCase>((i) => SaveUserUseCaseImp(i())),
        Bind<UpdateUserUseCase>((i) => UpdateUserUseCaseImp(i())),
        Bind<DeleteUserUseCase>((i) => DeleteUserUseCaseImp(i())),
        Bind<GetAllBooksUseCase>((i) => GetAllBooksUseCaseImp(i())),
        Bind<GetBooksMostRentedUseCase>(
            (i) => GetBooksMostRentedUseCaseImp(i())),
        Bind<SaveBookUseCase>((i) => SaveBookUseCaseImp(i())),
        Bind<UpdateBookUseCase>((i) => UpdateBookUseCaseImp(i())),
        Bind<DeleteBookUseCase>((i) => DeleteBookUseCaseImp(i())),
        Bind<GetAllPublishersUseCase>((i) => GetAllPublishersUseCaseImp(i())),
        Bind<SavePublisherUseCase>((i) => SavePublisherUseCaseImp(i())),
        Bind<UpdatePublisherUseCase>((i) => UpdatePublisherUseCaseImp(i())),
        Bind<DeletePublisherUseCase>((i) => DeletePublisherUseCaseImp(i())),
        Bind<GetAllRentsUseCase>((i) => GetAllRentsUseCaseImp(i())),
        Bind<SaveRentUseCase>((i) => SaveRentUseCaseImp(i())),
        Bind<UpdateRentUseCase>((i) => UpdateRentUseCaseImp(i())),
        Bind<DeleteRentUseCase>((i) => DeleteRentUseCaseImp(i())),
        Bind.factory((i) => HomeController(i(), i(), i(), i(), i())),
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
