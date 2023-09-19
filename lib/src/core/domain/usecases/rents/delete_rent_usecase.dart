import 'package:flutter_bookstore2/src/core/domain/models/rent_model.dart';

abstract class DeleteRentUseCase {
  Future<void> call(RentModel rent);
}
