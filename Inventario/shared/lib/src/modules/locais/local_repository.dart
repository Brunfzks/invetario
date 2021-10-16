import 'dart:convert';

import 'package:shared/config/api.dart';
import 'package:shared/src/modules/locais/local_model.dart';
import 'package:http/http.dart' as http;

class LocalRepository {
  Future<List<ModelLocal>> getLocais(int Id_Usuario) async {
    String urlApi = Api.url('locais/$Id_Usuario');

    List<ModelLocal> lista = [];

    try {
      http.Response response = await http.get(Uri.parse(urlApi), headers: {
        'Content-Type': 'application/json',
        "Access-Control-Allow-Origin": "*",
      });

      if (response.statusCode == 200) {
        final List parsedList = json.decode(Utf8Decoder().convert(response.body.codeUnits));

        parsedList.map((val) {
          lista.add(ModelLocal.fromJson(val));
        }).toList();
        return lista;
      } else {
        throw Exception("Failed to load");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<int> cadastraLocais(
    ModelLocal modelLoca,
  ) async {
    String urlApi = Api.url('locais');

    modelLoca.idLocal = null;
    Map data = modelLoca.toJson();

    var body = json.encode(data);

    http.Response response = await http.post(Uri.parse(urlApi),
        headers: {
          'Content-Type': 'application/json',
        },
        body: body);

    if (response.statusCode == 200) {
      List<dynamic> map = json.decode(Utf8Decoder().convert(response.body.codeUnits));
      return map[0][''];
    } else {
      throw Exception("Failed to load");
    }
  }
}
