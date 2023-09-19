import 'package:flutter_bookstore2/src/core/domain/models/user_model.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/users_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/users/update_user_usecase.dart';
import 'package:flutter_bookstore2/src/core/errors/response_error.dart';

class UpdateUserUseCaseImp implements UpdateUserUseCase {
  final UsersRepository _repository;

  UpdateUserUseCaseImp(this._repository);

  @override
  Future<void> call(UserModel user) async {
    try {
      await _repository.update(user);
    } catch (e) {
      if (e is ResponseError) {
        if (e.error['status'] == 400) {
          throw Exception(e.error['error']);
        } else {
          throw Exception('Erro ao tentar editar usuário');
        }
      }
    }
  }
}
