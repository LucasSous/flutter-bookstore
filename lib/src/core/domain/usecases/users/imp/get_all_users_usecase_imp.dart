import 'package:flutter_bookstore2/src/core/domain/models/user_model.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/users_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/users/get_all_users_usecase.dart';

class GetAllUsersUseCaseImp implements GetAllUsersUseCase {
  final UsersRepository _repository;

  GetAllUsersUseCaseImp(this._repository);

  @override
  Future<List<UserModel>> call() async {
    final response = await _repository.getAll();
    response.sort((a, b) => b.id!.compareTo(a.id!));
    return response;
  }
}
