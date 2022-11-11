import 'package:flutter_bookstore2/src/Components/snack_bar.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Model/book_model.dart';
import 'package:flutter_bookstore2/src/Modules/Books/Repository/book_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Model/publisher_model.dart';
import 'package:flutter_bookstore2/src/Modules/Publishers/Repository/publisher_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Model/rent_model.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Repository/rent_repository.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Model/user_model.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Repository/user_repository.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  late final RentRepository rentRepo;
  late final UserRepository userRepo;
  late final BookRepository bookRepo;
  late final PublisherRepository publisherRepo;

  HomeControllerBase(
      this.rentRepo, this.userRepo, this.bookRepo, this.publisherRepo) {
    getAllRents();
    getAllUsers();
    getAllBooks();
    getMostRented();
    getAllPublishers();
  }

  @observable
  List<Rent> rents = [];

  @observable
  List<User> users = [];

  @observable
  List<Book> books = [];

  @observable
  List<Book> mostRented = [];

  @observable
  List<Publisher> publishers = [];

  @observable
  bool loadingRents = false;

  @observable
  bool loadingUsers = false;

  @observable
  bool loadingBooks = false;

  @observable
  bool loadingPublishers = false;

  @observable
  bool loadingMostRenteds = false;

  @observable
  int inProgress = 0;

  @observable
  int late = 0;

  @observable
  int onTime = 0;

  @observable
  int pending = 0;

  @action
  getAllRents() async {
    loadingRents = true;
    try {
      final response = await rentRepo.getAll();
      response.sort((a, b) => b.id.compareTo(a.id));
      rents = response;
      setValues();
    } catch (e) {
      showSnackBar('Erro ao tentar listar aluguéis', 'error');
    } finally {
      loadingRents = false;
    }
  }

  @action
  getAllUsers() async {
    loadingUsers = true;
    try {
      final response = await userRepo.getAll();
      response.sort((a, b) => b.id.compareTo(a.id));
      users = response;
    } catch (e) {
      showSnackBar('Erro ao tentar listar usuários', 'error');
    } finally {
      loadingUsers = false;
    }
  }

  @action
  getAllBooks() async {
    loadingBooks = true;
    try {
      final response = await bookRepo.getAll();
      response.sort((a, b) => b.id.compareTo(a.id));
      books = response;
    } catch (e) {
      showSnackBar('Erro ao tentar listar livros', 'error');
    } finally {
      loadingBooks = false;
    }
  }

  @action
  getMostRented() async {
    loadingMostRenteds = true;
    try {
      final response = await bookRepo.getMostRented();
      mostRented = response;
    } catch (e) {
      showSnackBar('Erro ao tentar listar livros mais alugados', 'error');
    } finally {
      loadingMostRenteds = false;
    }
  }

  @action
  getAllPublishers() async {
    loadingPublishers = true;
    try {
      final response = await publisherRepo.getAll();
      response.sort((a, b) => b.id.compareTo(a.id));
      publishers = response;
    } catch (e) {
      showSnackBar('Erro ao tentar listar editoras', 'error');
    } finally {
      loadingPublishers = false;
    }
  }

  @action
  setValues() {
    List<Rent> noNullDate = rents.map((e) {
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
                  DateTime.parse(rent.returnDate)
                          .compareTo(DateTime.parse(rent.forecastDate)) <=
                      0)
                {onTime += 1},
              if (rent.returnDate.toString() != 'in progress' &&
                  DateTime.parse(rent.returnDate)
                          .compareTo(DateTime.parse(rent.forecastDate)) >
                      0)
                {late += 1},
            })
        .toList();
  }
}
