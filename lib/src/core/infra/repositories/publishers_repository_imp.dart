import 'package:flutter_bookstore2/src/core/infra/datasourses/publishers_datasourse.dart';
import 'package:flutter_bookstore2/src/core/domain/models/publisher_model.dart';
import 'package:flutter_bookstore2/src/core/domain/repositories/publishers_repository.dart';

class PublishersRepositoryImp implements PublishersRepository {
  final PublishersDataSourse _publishersDataSourse;

  PublishersRepositoryImp(this._publishersDataSourse);

  @override
  Future<List<PublisherModel>> getAll() async {
    return await _publishersDataSourse.getAll();
  }

  @override
  Future<void> save(PublisherModel publisher) async {
    await _publishersDataSourse.save(publisher);
  }

  @override
  Future<void> update(PublisherModel publisher) async {
    await _publishersDataSourse.update(publisher);
  }

  @override
  Future<void> delete(PublisherModel publisher) async {
    await _publishersDataSourse.delete(publisher);
  }
}
