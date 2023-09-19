import 'package:flutter_bookstore2/src/core/domain/models/user_model.dart';

abstract class DeleteUserUseCase {
  Future<void> call(UserModel user);
}
