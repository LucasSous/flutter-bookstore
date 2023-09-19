import 'package:flutter_bookstore2/src/components/snack_bar.dart';
import 'package:flutter_bookstore2/src/core/domain/models/user_model.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/users/delete_user_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/users/get_all_users_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/users/save_user_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/users/update_user_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'user_controller.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {
  final GetAllUsersUseCase _getAllUsersUseCase;
  final SaveUserUseCase _saveUserUseCase;
  final UpdateUserUseCase _updateUserUseCase;
  final DeleteUserUseCase _deleteUserUseCase;

  UserControllerBase(
    this._getAllUsersUseCase,
    this._saveUserUseCase,
    this._updateUserUseCase,
    this._deleteUserUseCase,
  ) {
    getAllUsers();
  }

  @observable
  List<UserModel> users = [];

  @observable
  List<UserModel> usersFilter = [];

  @observable
  bool isEmptyInput = true;

  @observable
  bool loading = false;

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
  Future<void> createUser(UserModel user) async {
    loading = true;
    try {
      await _saveUserUseCase(user);
      showSnackBar('Usuário cadastrado com sucesso', Status.success);
      await getAllUsers();
      Modular.to.pop();
    } catch (e) {
      showSnackBar(e.toString(), Status.error);
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> updateUser(UserModel user) async {
    if (user.id != null) {
      try {
        await _updateUserUseCase(user);
        showSnackBar('Usuário editado com sucesso', Status.success);
        Modular.to.pop();
        await getAllUsers();
      } catch (e) {
        showSnackBar(e.toString(), Status.error);
      }
    }
  }

  @action
  Future<void> deleteUser(UserModel user) async {
    try {
      await _deleteUserUseCase(user);
      showSnackBar('Usuário deletado com sucesso', Status.success);
      Modular.to.navigate('/users/');
      await getAllUsers();
    } catch (e) {
      showSnackBar(e.toString(), Status.error);
    }
  }

  @action
  void filter(String value) {
    if (value.isEmpty) {
      usersFilter = [];
      isEmptyInput = true;
      return;
    } else {
      isEmptyInput = false;
    }

    List<UserModel> list = users
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
  void resetFilter() {
    usersFilter = [];
    isEmptyInput = true;
  }
}
