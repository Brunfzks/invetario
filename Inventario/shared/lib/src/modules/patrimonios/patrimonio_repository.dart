import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared/config/api.dart';
import 'package:shared/src/modules/patrimonios/patrimonio_model.dart';

class PatrimonioRepository {
  Future<List<ModelPatrimonio>> getPatrimonios({required int Id_local}) async {
    String urlApi = Api.url('patrimonios/$Id_local');

    List<ModelPatrimonio> lista = [];

    try {
      http.Response response = await http.get(Uri.parse(urlApi), headers: {
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        final List parsedList = json.decode(Utf8Decoder().convert(response.body.codeUnits));

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

  Future<int> cadastraPatrimonios(
    ModelPatrimonio modelPatrimonio,
  ) async {
    String urlApi = Api.url('patrimonios');

    modelPatrimonio.idBem = null;

    Map data = modelPatrimonio.toJson();

    var body = json.encode(data);

    http.Response response = await http.post(Uri.parse(urlApi),
        headers: {
          'Content-Type': 'application/json',
        },
        body: body);

    if (response.statusCode == 200) {
      List<dynamic> map = json.decode(response.body);
      return map[0][''];
    } else {
      throw Exception("Failed to load");
    }
  }
}
