import 'dart:convert';

import 'package:shared/config/api.dart';
import 'package:shared/src/modules/notificacoes/notificacao_model.dart';
import 'package:http/http.dart' as http;

class NorificacaoRepository {
  Future<List<ModelNotificacao>> getNotificacoes() async {
    String urlApi = Api.url('notificacoes');

    List<ModelNotificacao> lista = [];

    try {
      http.Response response = await http.get(Uri.parse(urlApi),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final List parsedList = json.decode(response.body);

        parsedList.map((val) {
          lista.add(ModelNotificacao.fromJson(val));
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
