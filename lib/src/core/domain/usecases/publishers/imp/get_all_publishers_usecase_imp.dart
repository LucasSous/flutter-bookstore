import 'package:flutter_bookstore2/src/core/domain/models/publisher_model.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/publishers_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/publishers/get_all_publishers_usecase.dart';

class GetAllPublishersUseCaseImp implements GetAllPublishersUseCase {
  final PublishersRepository _repository;

  GetAllPublishersUseCaseImp(this._repository);

  @override
  Future<List<PublisherModel>> call() async {
    final response = await _repository.getAll();
    response.sort((a, b) => b.id!.compareTo(a.id!));
    return response;
  }
}
