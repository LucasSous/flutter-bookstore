import 'package:flutter_bookstore2/src/core/domain/models/publisher_model.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/publishers_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/publishers/delete_publisher_usercase.dart';

class DeletePublisherUseCaseImp implements DeletePublisherUseCase {
  final PublishersRepository _repository;

  DeletePublisherUseCaseImp(this._repository);

  @override
  Future<void> call(PublisherModel publisher) async {
    await _repository.delete(publisher);
  }
}
