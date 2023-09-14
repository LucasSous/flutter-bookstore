import 'package:flutter_bookstore2/src/core/domain/repositories/publishers_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/useCases/publishers_usecase.dart';
import 'package:flutter_bookstore2/src/core/domain/models/publisher_model.dart';

class PublishersUseCaseImp implements PublishersUseCase {
  final PublishersRepository _repository;

  PublishersUseCaseImp(this._repository);

  @override
  Future<List<PublisherModel>> getAll() async {
    final response = await _repository.getAll();
    response.sort((a, b) => b.id!.compareTo(a.id!));
    return response;
  }

  @override
  Future<void> save(PublisherModel publisher) async {
    await _repository.save(publisher);
  }

  @override
  Future<void> update(PublisherModel publisher) async {
    await _repository.update(publisher);
  }

  @override
  Future<void> delete(PublisherModel publisher) async {
    await _repository.delete(publisher);
  }
}
