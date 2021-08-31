import 'dart:convert';

import 'package:shared/config/api.dart';
import 'package:shared/src/modules/usuarios/usuario_model.dart';
import 'package:http/http.dart' as http;

class UsuarioRepository {
  Future<List<ModelUsuario>> getUsuarios() async {
    String urlApi = Api.url('usuarios');

    List<ModelUsuario> lista = [];

    try {
      http.Response response = await http.get(Uri.parse(urlApi),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 200) {
        final List parsedList = json.decode(response.body);

        parsedList.map((val) {
          lista.add(ModelUsuario.fromJson(val));
        }).toList();
        return lista;
      } else {
        throw Exception("Failed to load");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<int> cadastraUsuario(
    ModelUsuario modelUsuario,
  ) async {
    String urlApi = Api.url('usuarios');

    Map data = modelUsuario.toJson();

    var body = json.encode(data);

    http.Response response = await http.post(Uri.parse(urlApi),
        headers: {'Content-Type': 'application/json'}, body: body);

    if (response.statusCode == 200) {
      List<dynamic> map = json.decode(response.body);
      return map[0][''];
    } else {
      throw Exception("Failed to load");
    }
  }
}
