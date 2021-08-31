import 'dart:convert';

import 'package:shared/config/api.dart';
import 'package:shared/src/modules/levantamentos/levantamento_model.dart';
import 'package:http/http.dart' as http;

class LevantamentoRepository {
  Future<List<LevantamentoModel>> getLevantamentos() async {
    String urlApi = Api.url('levantamentos');

    List<LevantamentoModel> lista = [];

    try {
      http.Response response = await http.get(Uri.parse(urlApi),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final List parsedList = json.decode(response.body);

        parsedList.map((val) {
          lista.add(LevantamentoModel.fromJson(val));
        }).toList();
        return lista;
      } else {
        throw Exception("Failed to load");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
