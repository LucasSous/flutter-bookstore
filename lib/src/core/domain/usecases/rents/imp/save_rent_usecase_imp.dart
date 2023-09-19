import 'package:flutter_bookstore2/src/core/domain/models/rent_model.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/rents_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/rents/save_rent_usecase.dart';
import 'package:flutter_bookstore2/src/core/errors/response_error.dart';

class SaveRentUseCaseImp implements SaveRentUseCase {
  final RentsRepository _rentsRepository;

  SaveRentUseCaseImp(this._rentsRepository);

  @override
  Future<void> call(RentModel rent) async {
    try {
      await _rentsRepository.save(rent);
    } catch (e) {
      if (e is ResponseError) {
        if (e.error['status'] == 400) {
          throw Exception(e.error['error']);
        } else {
          throw Exception('Erro ao tentar cadastrar aluguél');
        }
      }
    }
  }
}
