import 'dart:convert';

import 'package:shared/config/api.dart';
import 'package:shared/src/modules/patrimonios/patrimonio_model.dart';
import 'package:http/http.dart' as http;

class PatrimonioRepository {
  Future<List<PatrimonioModel>> getPatrimonios() async {
    String urlApi = Api.url('patrimonios');

    List<PatrimonioModel> lista = [];

    try {
      http.Response response = await http.get(Uri.parse(urlApi),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final List parsedList = json.decode(response.body);

        parsedList.map((val) {
          lista.add(PatrimonioModel.fromJson(val));
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
