import 'package:flutter_bookstore2/src/core/domain/models/rent_model.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/rents_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/rents/get_all_rents_usecase.dart';

class GetAllRentsUseCaseImp implements GetAllRentsUseCase {
  final RentsRepository _rentsRepository;

  GetAllRentsUseCaseImp(this._rentsRepository);

  @override
  Future<List<RentModel>> call() async {
    final response = await _rentsRepository.getAll();
    response.sort((a, b) => b.id!.compareTo(a.id!));
    return response;
  }
}
