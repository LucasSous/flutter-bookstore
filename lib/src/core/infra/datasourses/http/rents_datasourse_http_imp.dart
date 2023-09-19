import 'dart:convert';

import 'package:flutter_bookstore2/src/core/domain/models/rent_model.dart';
import 'package:flutter_bookstore2/src/core/errors/response_error.dart';
import 'package:flutter_bookstore2/src/core/infra/datasourses/rents_datasourse.dart';
import 'package:flutter_bookstore2/src/api/api.dart';
import 'package:flutter_bookstore2/src/core/infra/dto/rent_dto.dart';
import 'package:http/http.dart' as http;

class RentsDataSourseHttpImp implements RentsDataSourse {
  final _url = '${Api.baseURL}/aluguel';
  final _headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
  };
  final _encoding = Encoding.getByName("utf-8");

  @override
  Future<List<RentModel>> getAll() async {
    final response = await http.get(Uri.parse('${Api.baseURL}/alugueis'));
    if (response.statusCode == 200) {
      final body = (jsonDecode(utf8.decode(response.bodyBytes)) as List);
      final data = body.map((item) => RentDto.fromJson(item)).toList();
      return data;
    }
    return List.empty();
  }

  @override
  Future<void> save(RentModel rent) async {
    final response = await http.post(Uri.parse(_url),
        headers: _headers,
        body: jsonEncode(RentDto.toJson(rent)),
        encoding: _encoding);

    if (response.statusCode != 200) {
      var body = jsonDecode(utf8.decode(response.bodyBytes));
      throw ResponseError(body);
    }
  }

  @override
  Future<void> update(RentModel rent) async {
    final response = await http.put(Uri.parse(_url),
        headers: _headers,
        body: jsonEncode(RentDto.toJson(rent)),
        encoding: _encoding);

    if (response.statusCode != 200) {
      var body = jsonDecode(utf8.decode(response.bodyBytes));
      throw ResponseError(body);
    }
  }

  @override
  Future<void> delete(RentModel rent) async {
    final response = await http.delete(Uri.parse(_url),
        headers: _headers,
        body: jsonEncode(RentDto.toJson(rent)),
        encoding: _encoding);

    if (response.statusCode != 200) {
      var body = jsonDecode(utf8.decode(response.bodyBytes));
      throw ResponseError(body);
    }
  }
}
