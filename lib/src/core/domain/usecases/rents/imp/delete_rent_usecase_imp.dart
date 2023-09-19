import 'package:flutter_bookstore2/src/core/domain/models/rent_model.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/rents_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/rents/delete_rent_usecase.dart';
import 'package:flutter_bookstore2/src/core/errors/response_error.dart';

class DeleteRentUseCaseImp implements DeleteRentUseCase {
  final RentsRepository _rentsRepository;

  DeleteRentUseCaseImp(this._rentsRepository);

  @override
  Future<void> call(RentModel rent) async {
    try {
      await _rentsRepository.delete(rent);
    } catch (e) {
      if (e is ResponseError) {
        if (e.error['status'] == 400) {
          throw Exception(e.error['error']);
        } else {
          throw Exception('Erro ao tentar deletar aluguél');
        }
      }
    }
  }
}
