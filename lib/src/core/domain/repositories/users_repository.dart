import 'package:flutter_bookstore2/src/core/domain/models/user_model.dart';

abstract class UsersRepository {
  Future<List<UserModel>> getAll();
  Future<void> save(UserModel user);
  Future<void> update(UserModel user);
  Future<void> delete(UserModel user);
}
