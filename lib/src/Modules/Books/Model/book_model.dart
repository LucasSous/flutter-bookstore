import 'package:flutter_bookstore2/src/Modules/Publishers/Model/publisher_model.dart';

class Book {
  dynamic id;
  dynamic name;
  dynamic author;
  Publisher? publisher;
  dynamic launch;
  dynamic quantity;
  dynamic totalRented;

  Book(
      {this.id,
      required this.name,
      required this.publisher,
      required this.author,
      required this.launch,
      required this.quantity,
      this.totalRented});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nome'];
    publisher =
        json['editora'] != null ? Publisher.fromJson(json['editora']) : null;
    author = json['autor'];
    launch = json['lancamento'];
    quantity = json['quantidade'];
    totalRented = json['totalalugado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = name;
    if (publisher != null) {
      data['editora'] = publisher!.toJson();
    }
    data['autor'] = author;
    data['lancamento'] = launch;
    data['quantidade'] = quantity;
    data['totalalugado'] = totalRented;
    return data;
  }
}
