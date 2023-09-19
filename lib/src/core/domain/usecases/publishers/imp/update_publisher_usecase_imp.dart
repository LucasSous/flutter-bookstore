import 'package:flutter_bookstore2/src/core/domain/models/publisher_model.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/publishers_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/publishers/update_publisher_usecase.dart';

class UpdatePublisherUseCaseImp implements UpdatePublisherUseCase {
  final PublishersRepository _repository;

  UpdatePublisherUseCaseImp(this._repository);

  @override
  Future<void> call(PublisherModel publisher) async {
    await _repository.update(publisher);
  }
}
