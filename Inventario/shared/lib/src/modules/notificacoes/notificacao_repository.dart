import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared/config/api.dart';
import 'package:shared/src/modules/notificacoes/notificacao_model.dart';

class NorificacaoRepository {
  Future<List<ModelNotificacao>> getNotificacoes(
      {required int Id_Usuario}) async {
    String urlApi = Api.url('notificacoes/${Id_Usuario}');

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
