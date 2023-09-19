import 'package:flutter_bookstore2/src/core/domain/models/book_model.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/get_all_books_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/get_books_most_rented_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/publishers/get_all_publishers_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/rents/get_all_rents_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/users/get_all_users_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/models/rent_model.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final GetAllUsersUseCase _getAllUsersUseCase;
  final GetAllBooksUseCase _getAllBooksUseCase;
  final GetBooksMostRentedUseCase _getBooksMostRentedUseCase;
  final GetAllPublishersUseCase _getAllPublishersUseCase;
  final GetAllRentsUseCase _getAllRentsUseCase;

  HomeControllerBase(
    this._getAllUsersUseCase,
    this._getAllBooksUseCase,
    this._getBooksMostRentedUseCase,
    this._getAllPublishersUseCase,
    this._getAllRentsUseCase,
  );

  @observable
  String usersQuantity = '0';

  @observable
  String booksQuantity = '0';

  @observable
  String publishersQuantity = '0';

  @observable
  String rentsQuantity = '0';

  List<BookModel> booksMostRented = [];

  @observable
  int inProgress = 0;

  @observable
  int late = 0;

  @observable
  int onTime = 0;

  @observable
  int pending = 0;

  @observable
  bool loading = false;

  @action
  Future<void> getUsersQuantity() async {
    loading = true;
    var users = await _getAllUsersUseCase();
    var quantity = users.length.toString();
    usersQuantity = quantity;
    loading = false;
  }

  @action
  Future<void> getBooksQuantity() async {
    loading = true;
    var books = await _getAllBooksUseCase();
    var quantity = books.length.toString();
    booksQuantity = quantity;
    loading = false;
  }

  @action
  Future<void> getPublishersQuantity() async {
    loading = true;
    var publishers = await _getAllPublishersUseCase();
    var quantity = publishers.length.toString();
    publishersQuantity = quantity;
    loading = false;
  }

  @action
  Future<void> getRentsQuantity() async {
    loading = true;
    var rents = await _getAllRentsUseCase();
    var quantity = rents.length.toString();
    rentsQuantity = quantity;
    loading = false;
  }

  @action
  Future<void> getBooksMostRented() async {
    loading = true;
    var mostRented = await _getBooksMostRentedUseCase();
    booksMostRented = mostRented;
    loading = false;
  }

  @action
  Future<void> setValues() async {
    loading = true;
    var rents = await _getAllRentsUseCase();
    List<RentModel> noNullDate = rents.map((e) {
      e.returnDate ??= 'in progress';
      return e;
    }).toList();
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);
    DateTime currentDate = DateTime.parse(formatted);
    noNullDate
        .map((rent) => {
              if (rent.returnDate.toString() == 'in progress' &&
                  DateTime.parse(rent.forecastDate).compareTo(currentDate) >= 0)
                {inProgress += 1},
              if (rent.returnDate.toString() == 'in progress' &&
                  DateTime.parse(rent.forecastDate).compareTo(currentDate) < 0)
                {pending += 1},
              if (rent.returnDate.toString() != 'in progress' &&
                  DateTime.parse(rent.returnDate!)
                          .compareTo(DateTime.parse(rent.forecastDate)) <=
                      0)
                {onTime += 1},
              if (rent.returnDate.toString() != 'in progress' &&
                  DateTime.parse(rent.returnDate!)
                          .compareTo(DateTime.parse(rent.forecastDate)) >
                      0)
                {late += 1},
            })
        .toList();
    loading = false;
  }
}
