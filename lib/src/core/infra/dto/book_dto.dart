import 'package:flutter_bookstore2/src/core/domain/models/book_model.dart';
import 'package:flutter_bookstore2/src/core/infra/dto/publisher_dto.dart';

class BookDto extends BookModel {
  BookDto({
    super.id,
    required super.name,
    super.publisher,
    required super.author,
    required super.launch,
    required super.quantity,
    super.totalRented,
  });

  static BookDto fromJson(Map<String, dynamic> json) {
    return BookDto(
      id: json['id'],
      name: json['nome'],
      publisher: json['editora'] != null
          ? PublisherDto.fromJson(json['editora'])
          : null,
      author: json['autor'],
      launch: json['lancamento'],
      quantity: json['quantidade'],
      totalRented: json['totalalugado'],
    );
  }

  static Map<String, dynamic> toJson(BookModel book) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = book.id;
    data['nome'] = book.name;
    if (book.publisher != null) {
      data['editora'] = PublisherDto.toJson(book.publisher!);
    }
    data['autor'] = book.author;
    data['lancamento'] = book.launch;
    data['quantidade'] = book.quantity;
    data['totalalugado'] = book.totalRented;
    return data;
  }
}
