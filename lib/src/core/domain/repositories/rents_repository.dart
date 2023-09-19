import 'package:flutter_bookstore2/src/core/domain/models/rent_model.dart';

abstract class RentsRepository {
  Future<List<RentModel>> getAll();
  Future<void> save(RentModel rent);
  Future<void> update(RentModel rent);
  Future<void> delete(RentModel rent);
}
