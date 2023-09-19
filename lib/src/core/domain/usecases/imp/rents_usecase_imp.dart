import 'package:flutter_bookstore2/src/core/domain/models/rent_model.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/rents_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/rents_usecase.dart';
import 'package:flutter_bookstore2/src/core/errors/response_error.dart';

class RentsUseCaseImp implements RentsUseCase {
  final RentsRepository _rentsRepository;

  RentsUseCaseImp(this._rentsRepository);

  @override
  Future<List<RentModel>> getAll() async {
    final response = await _rentsRepository.getAll();
    response.sort((a, b) => b.id!.compareTo(a.id!));
    return response;
  }

  @override
  Future<void> save(RentModel rent) async {
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

  @override
  Future<void> update(RentModel rent) async {
    try {
      await _rentsRepository.update(rent);
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

  @override
  Future<void> delete(RentModel rent) async {
    try {
      await _rentsRepository.delete(rent);
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
