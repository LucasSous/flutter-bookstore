// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_bookstore2/src/components/snack_bar.dart';
import 'package:flutter_bookstore2/src/core/domain/models/book_model.dart';
import 'package:flutter_bookstore2/src/core/domain/models/rent_model.dart';
import 'package:flutter_bookstore2/src/core/domain/models/user_model.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/books/get_all_books_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/rents/delete_rent_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/rents/get_all_rents_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/rents/save_rent_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/rents/update_rent_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/users/get_all_users_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
part 'rent_controller.g.dart';

class RentController = _RentControllerBase with _$RentController;

abstract class _RentControllerBase with Store {
  final GetAllRentsUseCase _getAllRentsUseCase;
  final SaveRentUseCase _saveRentUseCase;
  final UpdateRentUseCase _updateRentUseCase;
  final DeleteRentUseCase _deleteRentUseCase;
  final GetAllUsersUseCase _getAllUsersUseCase;
  final GetAllBooksUseCase _getAllBooksUseCase;

  _RentControllerBase(
    this._getAllRentsUseCase,
    this._saveRentUseCase,
    this._updateRentUseCase,
    this._deleteRentUseCase,
    this._getAllUsersUseCase,
    this._getAllBooksUseCase,
  ) {
    getAllUsers();
    getAllBooks();
    getAllRents();
  }

  @observable
  List<RentModel> rents = [];

  @observable
  List<UserModel> users = [];

  @observable
  List<BookModel> books = [];

  @observable
  List<RentModel> rentsInProgress = [];

  @observable
  List<RentModel> finishedRents = [];

  @observable
  List<RentModel> defaultValueRentsInProgress = [];

  @observable
  List<RentModel> defaultValueFinishedRents = [];

  @observable
  List<RentModel> rentsFilter = [];

  @observable
  bool loading = false;

  @observable
  bool loadingDelete = false;

  @observable
  bool loadingFinished = false;

  @action
  Future<void> getAllUsers() async {
    loading = true;
    try {
      final response = await _getAllUsersUseCase();
      users = response;
    } catch (e) {
      showSnackBar('Erro ao tentar listar usuários', Status.error);
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> getAllBooks() async {
    loading = true;
    try {
      final response = await _getAllBooksUseCase();
      books = response;
    } catch (e) {
      showSnackBar('Erro ao tentar listar livros', Status.error);
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> getAllRents() async {
    loading = true;
    try {
      final response = await _getAllRentsUseCase();
      rents = response;
      getRentsInProgress(true);
      getFinishedRents(true);
    } catch (e) {
      showSnackBar('Erro ao tentar listar aluguéis', Status.error);
    } finally {
      loading = false;
    }
  }

  List<RentModel> _noNullDate() {
    return rents.map((e) {
      e.returnDate ??= 'in progress';
      return e;
    }).toList();
  }

  @action
  void getRentsInProgress(bool showAll) {
    List<RentModel> list = [];
    try {
      List<RentModel> filter = _noNullDate()
          .where((e) => e.returnDate.toString() == 'in progress')
          .toList();

      if (showAll) {
        if (filter.length > 10) {
          list = filter.sublist(0, 10);
        } else {
          list = filter;
        }
      } else {
        list = filter;
      }

      rentsInProgress = list;
      defaultValueRentsInProgress = filter;
    } catch (e) {
      showSnackBar('Erro ao tentar listar aluguéis em andamento', Status.error);
    }
  }

  @action
  void getFinishedRents(bool showAll) {
    List<RentModel> list = [];
    try {
      List<RentModel> filter = _noNullDate()
          .where((e) => e.returnDate.toString() != 'in progress')
          .toList();

      if (showAll) {
        if (filter.length > 10) {
          list = filter.sublist(0, 10);
        } else {
          list = filter;
        }
      } else {
        list = filter;
      }

      finishedRents = list;
      defaultValueFinishedRents = filter;
    } catch (e) {
      showSnackBar('Erro ao tentar listar aluguéis finalizados', Status.error);
    }
  }

  @action
  void filterFinishedRents(status) {
    if (status == 'No prazo') {
      List<RentModel> filter = defaultValueFinishedRents
          .where((e) =>
              DateTime.parse(e.returnDate!)
                  .compareTo(DateTime.parse(e.forecastDate)) <=
              0)
          .toList();

      finishedRents = filter;
    } else if (status == 'Em atraso') {
      List<RentModel> filter = defaultValueFinishedRents
          .where((e) =>
              DateTime.parse(e.returnDate!)
                  .compareTo(DateTime.parse(e.forecastDate)) >
              0)
          .toList();

      finishedRents = filter;
    } else {
      finishedRents = defaultValueFinishedRents;
    }
  }

  @action
  void filterRents(date) {
    if (date.isEmpty) {
      rentsFilter = [];
      return;
    }
    List<String> searchDate = date.split('/');
    String formatDate = '${searchDate[2]}-${searchDate[1]}-${searchDate[0]}';

    List<RentModel> noNullDate = rents.map((e) {
      e.returnDate ??= 'in progress';
      return e;
    }).toList();

    List<RentModel> list = noNullDate
        .where((rent) =>
            rent.creationDate.toString().contains(formatDate) ||
            rent.forecastDate.toString().contains(formatDate) ||
            rent.returnDate.toString().contains(formatDate))
        .toList();

    rentsFilter = list;
  }

  @action
  void filterRentsInProgress(status) {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);
    DateTime currentDate = DateTime.parse(formatted);
    if (status == 'Pendentes') {
      List<RentModel> filter = defaultValueRentsInProgress
          .where(
              (e) => DateTime.parse(e.forecastDate).compareTo(currentDate) < 0)
          .toList();

      rentsInProgress = filter;
    } else if (status == 'Em andamento') {
      List<RentModel> filter = defaultValueRentsInProgress
          .where(
              (e) => DateTime.parse(e.forecastDate).compareTo(currentDate) >= 0)
          .toList();

      rentsInProgress = filter;
    } else {
      rentsInProgress = defaultValueRentsInProgress;
    }
  }

  @action
  void updateLists() {
    getFinishedRents(true);
    getRentsInProgress(true);
  }

  @action
  Future<void> createRent(RentModel rent) async {
    try {
      loading = true;
      await _saveRentUseCase(rent);
      showSnackBar('Aluguél cadastrado com sucesso', Status.success);
      Modular.to.pop();
      await getAllRents();
      loading = false;
    } catch (e) {
      showSnackBar(e.toString(), Status.error);
    }
  }

  @action
  Future<void> updateRent(RentModel rent) async {
    try {
      loadingFinished = true;
      await _updateRentUseCase(rent);
      showSnackBar('Aluguél finalizado com sucesso', Status.success);
      Modular.to.pop();
      await getAllRents();
      loadingFinished = false;
    } catch (e) {
      showSnackBar(e.toString(), Status.error);
    }
  }

  @action
  Future<void> deleteRent(RentModel rent) async {
    try {
      loadingDelete = true;
      await _deleteRentUseCase(rent);
      showSnackBar('Aluguél cancelado com sucesso', Status.success);
      Modular.to.navigate('/rents/');
      await getAllRents();
      loadingDelete = false;
    } catch (e) {
      showSnackBar(e.toString(), Status.error);
    }
  }
}
