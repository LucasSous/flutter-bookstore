import 'package:flutter_bookstore2/src/core/domain/models/publisher_model.dart';

abstract class PublishersDataSourse {
  Future<List<PublisherModel>> getAll();
  Future<void> save(PublisherModel publisher);
  Future<void> update(PublisherModel publisher);
  Future<void> delete(PublisherModel publisher);
}
