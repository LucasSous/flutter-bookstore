// ignore_for_file: library_private_types_in_public_api

import 'package:flutter_bookstore2/src/Components/snack_bar.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Model/user_model.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Repository/user_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  final UserRepository userRepo;

  _UserControllerBase(this.userRepo) {
    getAllUsers();
  }

  @observable
  List<User> users = [];

  @observable
  List<User> usersFilter = [];

  @observable
  bool isEmptyInput = true;

  @observable
  bool loading = false;

  @action
  getAllUsers() async {
    loading = true;
    try {
      final response = await userRepo.getAll();
      response.sort((a, b) => b.id.compareTo(a.id));
      users = response;
    } catch (e) {
      showSnackBar('Erro ao tentar listar usuários', 'error');
    } finally {
      loading = false;
    }
  }

  @action
  createUser(User user) async {
    // ignore: unnecessary_null_comparison
    if (user != null) {
      loading = true;
      try {
        await userRepo.save(user);
        showSnackBar('Usuário cadastrado com sucesso', 'success');
        await getAllUsers();
        Modular.to.pop();
      } catch (e) {
        showSnackBar('Erro ao tentar cadastar usuário', 'error');
      } finally {
        loading = false;
      }
    }
  }

  @action
  updateUser(User user) async {
    // ignore: unnecessary_null_comparison
    if (user != null && user.id != null) {
      loading = true;
      try {
        await userRepo.update(user);
        showSnackBar('Usuário editado com sucesso', 'success');
        await getAllUsers();
        Modular.to.pop();
        // Modular.to.pop();
      } catch (e) {
        showSnackBar('Erro ao tentar editar usuário', 'error');
      } finally {
        loading = false;
      }
    }
  }

  @action
  deleteUser(User user) async {
    // ignore: unnecessary_null_comparison
    if (user != null) {
      loading = true;
      try {
        await userRepo.delete(user);
        showSnackBar('Usuário deletado com sucesso', 'success');
        Modular.to.pop();
      } catch (e) {
        showSnackBar('Erro ao tentar deletar usuário', 'error');
      } finally {
        await getAllUsers();
        loading = false;
      }
    }
  }

  @action
  filter(String value) async {
    if (value.isEmpty) {
      usersFilter = [];
      isEmptyInput = true;
      return;
    } else {
      isEmptyInput = false;
    }

    List<User> list = users
        .where(
          (e) =>
              e.id.toString().toLowerCase().contains(
                    value.toString(),
                  ) ||
              e.name.toString().toLowerCase().contains(
                    (value.toLowerCase()),
                  ) ||
              e.address.toString().toLowerCase().contains(
                    (value.toLowerCase()),
                  ) ||
              e.city.toString().toLowerCase().contains(
                    (value.toLowerCase()),
                  ) ||
              e.email.toString().toLowerCase().contains(
                    (value.toLowerCase()),
                  ),
        )
        .toList();

    usersFilter = list;
  }

  @action
  resetFilter() {
    usersFilter = [];
    isEmptyInput = true;
  }
}
