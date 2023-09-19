import 'package:flutter_bookstore2/src/core/domain/models/publisher_model.dart';

class BookModel {
  int? id;
  String name;
  String author;
  PublisherModel? publisher;
  int launch;
  int quantity;
  int? totalRented;

  BookModel({
    this.id,
    required this.name,
    required this.publisher,
    required this.author,
    required this.launch,
    required this.quantity,
    this.totalRented,
  });
}
