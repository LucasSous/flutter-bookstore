// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_bookstore2/src/Components/snack_bar.dart';
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
    getRentsInProgress();
    getFinishedRents();
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
    } catch (e) {
      showSnackBar('Erro ao tentar listar aluguéis', 'error');
    } finally {
      loading = false;
    }
  }

  @action
  getRentsInProgress() async {
    loading = true;
    try {
      final response = await rentRepo.getAll();
      List<Rent> noNullDate = response.map((e) {
        e.returnDate ??= 'in progress';
        return e;
      }).toList();

      List<Rent> filter = noNullDate
          .where((e) => e.returnDate.toString() == 'in progress')
          .toList();

      rentsInProgress = filter;
      defaultValueRentsInProgress = filter;
    } catch (e) {
      showSnackBar('Erro ao tentar listar aluguéis em andamento', 'error');
    } finally {
      loading = false;
    }
  }

  @action
  getFinishedRents() async {
    loading = true;
    try {
      final response = await rentRepo.getAll();
      List<Rent> noNullDate = response.map((e) {
        e.returnDate ??= 'in progress';
        return e;
      }).toList();

      List<Rent> filter = noNullDate
          .where((e) => e.returnDate.toString() != 'in progress')
          .toList();

      finishedRents = filter;
      defaultValueFinishedRents = filter;
    } catch (e) {
      showSnackBar('Erro ao tentar listar aluguéis finalizados', 'error');
    } finally {
      loading = false;
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
    finishedRents = defaultValueFinishedRents;
    rentsInProgress = defaultValueRentsInProgress;
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
        await getRentsInProgress();
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
        await getRentsInProgress();
        await getFinishedRents();
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
        await getRentsInProgress();
        loadingDelete = false;
      }
    }
  }
}
