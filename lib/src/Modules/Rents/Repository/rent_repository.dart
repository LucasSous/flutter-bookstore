import 'dart:convert';

import 'package:flutter_bookstore2/src/Api/api.dart';
import 'package:flutter_bookstore2/src/Modules/Rents/Model/rent_model.dart';
import 'package:http/http.dart' as http;

class RentRepository {
  Future<List<Rent>> getAll() async {
    final response = await http.get(Uri.parse('${Api.baseURL}/alugueis'));
    final body = (jsonDecode(utf8.decode(response.bodyBytes)) as List);
    final data = body.map((item) => Rent.fromJson(item)).toList();
    return data;
  }

  Future<void> save(Rent rent) async {
    await http.post(Uri.parse('${Api.baseURL}/aluguel'),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          'usuario_id': {'id': rent.user?.id},
          'livro_id': {'id': rent.book?.id},
          'data_aluguel': rent.creationDate,
          'data_previsao': rent.forecastDate,
          'data_devolucao': rent.returnDate
        }),
        encoding: Encoding.getByName("utf-8"));
  }
}
