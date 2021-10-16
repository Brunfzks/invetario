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
        final List parsedList = json.decode(Utf8Decoder().convert(response.body.codeUnits));

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

  Future<String> InsertLevantamento({required int  Id_Local,
    required int Nm_Patrimonio,
    required int Id_Levantamento,
    required int Id_usuario,
    required bool notificacao }) async {
    String urlApi = Api.url('levantamentos');

    Map data = {
      "Id_Local": Id_Local,
      "Nm_Patrimonio": Nm_Patrimonio,
      "Id_Levantamento": Id_Levantamento,
      "Id_usuario": Id_usuario,
      "Notificacao": notificacao
    };

    var body = json.encode(data);

    http.Response response = await http.post(Uri.parse(urlApi),
        headers: {
          'Content-Type': 'application/json',
        },
        body: body);

    if (response.statusCode == 200) {
      List<dynamic> map = json.decode(Utf8Decoder().convert(response.body.codeUnits));
      print('RESULT LEVANTAMENTO '+map[0]['RESULT'] );
      return map[0]['RESULT'];
    } else {
      throw Exception("Failed to load");
    }
  }
}
