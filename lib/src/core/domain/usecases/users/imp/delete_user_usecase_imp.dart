import 'package:flutter_bookstore2/src/core/domain/models/user_model.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/users_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/users/delete_user_usecase.dart';
import 'package:flutter_bookstore2/src/core/errors/response_error.dart';

class DeleteUserUseCaseImp implements DeleteUserUseCase {
  final UsersRepository _repository;

  DeleteUserUseCaseImp(this._repository);

  @override
  Future<void> call(UserModel user) async {
    try {
      await _repository.delete(user);
    } catch (e) {
      if (e is ResponseError) {
        if (e.error['status'] == 400) {
          throw Exception(e.error['error']);
        } else {
          throw Exception('Erro ao tentar deletar usuário');
        }
      }
    }
  }
}
