import 'package:flutter_bookstore2/src/core/domain/models/publisher_model.dart';

class PublisherDto extends PublisherModel {
  PublisherDto({
    required super.id,
    required super.name,
    required super.city,
  });

  static PublisherDto fromJson(Map<String, dynamic> json) {
    return PublisherDto(
      id: json['id'],
      name: json['nome'],
      city: json['cidade'],
    );
  }

  static Map<String, dynamic> toJson(PublisherModel publisher) {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = publisher.id;
    data['nome'] = publisher.name;
    data['cidade'] = publisher.city;
    return data;
  }
}
