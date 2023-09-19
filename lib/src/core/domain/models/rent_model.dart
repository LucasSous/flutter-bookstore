import 'package:flutter_bookstore2/src/core/domain/models/book_model.dart';
import 'package:flutter_bookstore2/src/core/domain/models/user_model.dart';

class RentModel {
  int? id;
  String creationDate;
  String? returnDate;
  String forecastDate;
  BookModel? book;
  UserModel? user;

  RentModel({
    this.id,
    required this.creationDate,
    required this.returnDate,
    required this.forecastDate,
    required this.book,
    required this.user,
  });
}
