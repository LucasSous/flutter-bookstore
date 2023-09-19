import 'package:flutter_bookstore2/src/core/domain/models/rent_model.dart';

abstract class GetAllRentsUseCase {
  Future<List<RentModel>> call();
}
