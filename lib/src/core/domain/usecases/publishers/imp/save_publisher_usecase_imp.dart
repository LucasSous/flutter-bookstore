import 'package:flutter_bookstore2/src/core/domain/models/publisher_model.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/publishers_repository.dart';
import 'package:flutter_bookstore2/src/core/domain/usecases/publishers/save_publisher_usecase.dart';

class SavePublisherUseCaseImp implements SavePublisherUseCase {
  final PublishersRepository _repository;

  SavePublisherUseCaseImp(this._repository);

  @override
  Future<void> call(PublisherModel publisher) async {
    await _repository.save(publisher);
  }
}
