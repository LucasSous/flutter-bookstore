import 'package:flutter_bookstore2/src/core/domain/models/rent_model.dart';
import 'package:flutter_bookstore2/src/core/infra/dto/book_dto.dart';
import 'package:flutter_bookstore2/src/core/infra/dto/user_dto.dart';

class RentDto extends RentModel {
  RentDto({
    super.id,
    required super.creationDate,
    required super.returnDate,
    required super.forecastDate,
    required super.book,
    required super.user,
  });

  static RentDto fromJson(Map<String, dynamic> json) {
    return RentDto(
      id: json['id'],
      creationDate: json['data_aluguel'],
      returnDate: json['data_devolucao'],
      forecastDate: json['data_previsao'],
      book:
          json['livro_id'] != null ? BookDto.fromJson(json['livro_id']) : null,
      user: json['usuario_id'] != null
          ? UserDto.fromJson(json['usuario_id'])
          : null,
    );
  }

  static Map<String, dynamic> toJson(RentModel rent) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = rent.id;
    data['data_aluguel'] = rent.creationDate;
    data['data_devolucao'] = rent.returnDate;
    data['data_previsao'] = rent.forecastDate;
    if (rent.book != null) {
      data['livro_id'] = BookDto.toJson(rent.book!);
    }
    if (rent.user != null) {
      data['usuario_id'] = UserDto.toJson(rent.user!);
    }
    return data;
  }
}
