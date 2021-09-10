import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared/config/api.dart';
import 'package:shared/src/modules/patrimonios/patrimonio_model.dart';

class PatrimonioRepository {
  Future<List<ModelPatrimonio>> getPatrimonios() async {
    String urlApi = Api.url('patrimonios');

    List<ModelPatrimonio> lista = [];

    try {
      http.Response response = await http.get(Uri.parse(urlApi),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final List parsedList = json.decode(response.body);

        parsedList.map((val) {
          lista.add(ModelPatrimonio.fromJson(val));
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
