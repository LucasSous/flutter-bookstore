// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_bookstore2/src/Components/snack_bar.dart';
import 'package:flutter_bookstore2/src/Modules/Home/Controller/home_controller.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Model/rent_model.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Repository/rent_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:intl/intl.dart';
part 'rent_controller.g.dart';

class RentController = _RentControllerBase with _$RentController;

abstract class _RentControllerBase with Store {
  final RentRepository rentRepo;

  _RentControllerBase(this.rentRepo) {
    getAllRents();
  }

  @observable
  List<Rent> rents = [];

  @observable
  List<Rent> rentsInProgress = [];

  @observable
  List<Rent> finishedRents = [];

  @observable
  List<Rent> defaultValueRentsInProgress = [];

  @observable
  List<Rent> defaultValueFinishedRents = [];

  @observable
  List<Rent> rentsFilter = [];

  @observable
  bool loading = false;

  @observable
  bool loadingDelete = false;

  @observable
  bool loadingFinished = false;

  @action
  getAllRents() async {
    loading = true;
    try {
      final response = await rentRepo.getAll();
      response.sort((a, b) => b.id.compareTo(a.id));
      rents = response;
      getRentsInProgress(true);
      getFinishedRents(true);
    } catch (e) {
      showSnackBar('Erro ao tentar listar aluguéis', 'error');
    } finally {
      loading = false;
    }
  }

  @action
  getRentsInProgress(bool showAll) async {
    List<Rent> list = [];
    try {
      List<Rent> noNullDate = rents.map((e) {
        e.returnDate ??= 'in progress';
        return e;
      }).toList();

      List<Rent> filter = noNullDate
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
      showSnackBar('Erro ao tentar listar aluguéis em andamento', 'error');
    }
  }

  @action
  getFinishedRents(bool showAll) async {
    List<Rent> list = [];
    try {
      List<Rent> noNullDate = rents.map((e) {
        e.returnDate ??= 'in progress';
        return e;
      }).toList();

      List<Rent> filter = noNullDate
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
      showSnackBar('Erro ao tentar listar aluguéis finalizados', 'error');
    }
  }

  @action
  filterFinishedRents(status) {
    if (status == 'No prazo') {
      List<Rent> filter = defaultValueFinishedRents
          .where((e) =>
              DateTime.parse(e.returnDate)
                  .compareTo(DateTime.parse(e.forecastDate)) <=
              0)
          .toList();

      finishedRents = filter;
    } else if (status == 'Em atraso') {
      List<Rent> filter = defaultValueFinishedRents
          .where((e) =>
              DateTime.parse(e.returnDate)
                  .compareTo(DateTime.parse(e.forecastDate)) >
              0)
          .toList();

      finishedRents = filter;
    } else {
      finishedRents = defaultValueFinishedRents;
    }
  }

  @action
  filterRents(date) {
    if (date.isEmpty) {
      rentsFilter = [];
      return;
    }
    List<String> searchDate = date.split('/');
    String formatDate = '${searchDate[2]}-${searchDate[1]}-${searchDate[0]}';

    List<Rent> noNullDate = rents.map((e) {
      e.returnDate ??= 'in progress';
      return e;
    }).toList();

    List<Rent> list = noNullDate
        .where((rent) =>
            rent.creationDate.toString().contains(formatDate) ||
            rent.forecastDate.toString().contains(formatDate) ||
            rent.returnDate.toString().contains(formatDate))
        .toList();

    rentsFilter = list;
  }

  @action
  filterRentsInProgress(status) {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(now);
    DateTime currentDate = DateTime.parse(formatted);
    if (status == 'Pendentes') {
      List<Rent> filter = defaultValueRentsInProgress
          .where(
              (e) => DateTime.parse(e.forecastDate).compareTo(currentDate) < 0)
          .toList();

      rentsInProgress = filter;
    } else if (status == 'Em andamento') {
      List<Rent> filter = defaultValueRentsInProgress
          .where(
              (e) => DateTime.parse(e.forecastDate).compareTo(currentDate) >= 0)
          .toList();

      rentsInProgress = filter;
    } else {
      rentsInProgress = defaultValueRentsInProgress;
    }
  }

  @action
  updateLists() {
    getFinishedRents(true);
    getRentsInProgress(true);
  }

  @action
  createRent(Rent rent) async {
    // ignore: unnecessary_null_comparison
    if (rent != null) {
      loading = true;
      try {
        await rentRepo.save(rent);
        showSnackBar('Aluguél cadastrado com sucesso', 'success');
        Modular.to.pop();
      } catch (e) {
        showSnackBar('Erro ao tentar cadastar aluguél', 'error');
      } finally {
        await getAllRents();
        loading = false;
      }
    }
  }

  @action
  updateRent(Rent rent) async {
    // ignore: unnecessary_null_comparison
    if (rent != null) {
      loadingFinished = true;
      try {
        await rentRepo.update(rent);
        showSnackBar('Aluguél finalizado com sucesso', 'success');
        Modular.to.pop();
      } catch (e) {
        showSnackBar('Erro ao tentar finalizar aluguél', 'error');
      } finally {
        await getAllRents();
        loadingFinished = false;
      }
    }
  }

  @action
  deleteRent(Rent rent) async {
    // ignore: unnecessary_null_comparison
    if (rent != null) {
      loadingDelete = true;
      try {
        await rentRepo.delete(rent);
        showSnackBar('Aluguél cancelado com sucesso', 'success');
        Modular.to.navigate('/rents/');
      } catch (e) {
        showSnackBar('Erro ao tentar cancelar aluguél', 'error');
      } finally {
        await getAllRents();
        loadingDelete = false;
      }
    }
  }
}
