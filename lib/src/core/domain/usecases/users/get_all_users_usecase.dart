import 'package:flutter_bookstore2/src/core/domain/models/user_model.dart';

abstract class GetAllUsersUseCase {
  Future<List<UserModel>> call();
}
