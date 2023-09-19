import 'package:flutter_bookstore2/src/core/domain/models/publisher_model.dart';

abstract class SavePublisherUseCase {
  Future<void> call(PublisherModel publisher);
}
