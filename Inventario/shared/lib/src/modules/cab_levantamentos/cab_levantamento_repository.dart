import 'dart:convert';

import 'package:shared/config/api.dart';
import 'package:shared/src/modules/cab_levantamentos/cab_levantamentos_model.dart';
import 'package:http/http.dart' as http;

class CabLevantamentoRepository {
  Future<CabLevantamentoModel> getCabLevantamento() async {
    String urlApi = Api.url('buscaLevantamento');

    try {
      http.Response response = await http.get(Uri.parse(urlApi),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        final map =
            json.decode(const Utf8Decoder().convert(response.body.codeUnits))
                as Map<String, dynamic>;
        return CabLevantamentoModel.fromJson(map);
      } else {
        throw Exception("Failed to load");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<String> atualizaLevantamento(
      int idUsuario, bool excluir, encerrado) async {
    String urlApi = '';
    if (excluir) {
      urlApi = Api.url('atualizaLevantamento/$idUsuario/1/0');
      if (encerrado) {
        urlApi = Api.url('atualizaLevantamento/$idUsuario/1/1');
      }
    } else {
      urlApi = Api.url('atualizaLevantamento/$idUsuario/0/0');
    }

    try {
      http.Response response = await http.get(Uri.parse(urlApi),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final map =
            json.decode(const Utf8Decoder().convert(response.body.codeUnits))
                as List;
        return map[0]['result'];
      } else {
        throw Exception("Failed to load");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
