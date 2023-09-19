import 'package:flutter_bookstore2/src/core/domain/models/rent_model.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/rents_repository.dart';
import 'package:flutter_bookstore2/src/core/infra/datasourses/rents_datasourse.dart';

class RentsRepositoryImp implements RentsRepository {
  final RentsDataSourse _rentsDataSourse;

  RentsRepositoryImp(this._rentsDataSourse);

  @override
  Future<List<RentModel>> getAll() async {
    return await _rentsDataSourse.getAll();
  }

  @override
  Future<void> save(RentModel rent) async {
    await _rentsDataSourse.save(rent);
  }

  @override
  Future<void> update(RentModel rent) async {
    await _rentsDataSourse.update(rent);
  }

  @override
  Future<void> delete(RentModel rent) async {
    await _rentsDataSourse.delete(rent);
  }
}
