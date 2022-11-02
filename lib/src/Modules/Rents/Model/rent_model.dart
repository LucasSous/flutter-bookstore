import 'package:flutter_bookstore2/src/Modules/Books/Model/book_model.dart';
import 'package:flutter_bookstore2/src/Modules/Users/Model/user_model.dart';

class Rent {
  dynamic id;
  dynamic creationDate;
  dynamic returnDate;
  dynamic forecastDate;
  Book? book;
  User? user;

  Rent({
    this.id,
    required this.creationDate,
    required this.returnDate,
    required this.forecastDate,
    required this.book,
    required this.user,
  });

  Rent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    creationDate = json['data_aluguel'];
    returnDate = json['data_devolucao'];
    forecastDate = json['data_previsao'];
    book = json['livro_id'] != null ? Book.fromJson(json['livro_id']) : null;
    user =
        json['usuario_id'] != null ? User.fromJson(json['usuario_id']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['data_aluguel'] = creationDate;
    data['data_devolucao'] = returnDate;
    data['data_previsao'] = forecastDate;
    if (book != null) {
      data['livro_id'] = book!.toJson();
    }
    if (user != null) {
      data['usuario_id'] = user!.toJson();
    }
    return data;
  }
}
