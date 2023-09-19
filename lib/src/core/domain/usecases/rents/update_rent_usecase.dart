import 'package:flutter_bookstore2/src/core/domain/models/rent_model.dart';

abstract class UpdateRentUseCase {
  Future<void> call(RentModel rent);
}
