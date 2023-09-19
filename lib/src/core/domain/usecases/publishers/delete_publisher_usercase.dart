import 'package:flutter_bookstore2/src/core/domain/models/publisher_model.dart';

abstract class DeletePublisherUseCase {
  Future<void> call(PublisherModel publisher);
}
