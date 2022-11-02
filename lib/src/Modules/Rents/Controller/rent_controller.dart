// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_bookstore2/src/Components/snack_bar.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Model/rent_model.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Repository/rent_repository.dart';
import 'package:mobx/mobx.dart';
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
  bool loading = false;

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
    } catch (e) {
      showSnackBar('Erro ao tentar listar aluguéis finalizados', 'error');
    } finally {
      loading = false;
    }
  }
}
