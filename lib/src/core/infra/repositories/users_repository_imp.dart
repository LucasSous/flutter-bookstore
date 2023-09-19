import 'package:flutter_bookstore2/src/core/domain/models/user_model.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/users_repository.dart';
import 'package:flutter_bookstore2/src/core/infra/datasourses/users_datasourse.dart';

class UsersRepositoryImp implements UsersRepository {
  final UsersDataSourse _usersDatasourse;

  UsersRepositoryImp(this._usersDatasourse);

  @override
  Future<List<UserModel>> getAll() async {
    return await _usersDatasourse.getAll();
  }

  @override
  Future<void> save(UserModel user) async {
    await _usersDatasourse.save(user);
  }

  @override
  Future<void> update(UserModel user) async {
    await _usersDatasourse.update(user);
  }

  @override
  Future<void> delete(UserModel user) async {
    await _usersDatasourse.delete(user);
  }
}
