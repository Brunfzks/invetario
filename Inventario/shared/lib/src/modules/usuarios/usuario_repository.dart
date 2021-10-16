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
        final List parsedList = json.decode(Utf8Decoder().convert(response.body.codeUnits));

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
      List<dynamic> map = json.decode(Utf8Decoder().convert(response.body.codeUnits));
      return map[0][''];
    } else {
      throw Exception("Failed to load");
    }
  }

  Future<bool> existeUsuario(
    String prontuario,
  ) async {
    String urlApi = Api.url('existeusuario/$prontuario');

    http.Response response = await http
        .get(Uri.parse(urlApi), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 400) {
      return false;
    } else {
      throw Exception("Failed to load");
    }
  }

  Future<ModelUsuario> getUsuario({required String usuario, senha}) async {
    String urlApi = Api.url('usuario');

    print("GET USUARIO " + urlApi);
    Map<String, dynamic> data = <String, dynamic>{};

    List<Map<String, dynamic>> listData = [];
    data['prontuario'] = usuario;
    data['senha'] = senha;

    listData.add(data);

    var body = json.encode(data);

    http.Response response = await http.post(Uri.parse(urlApi),
        headers: {'Content-Type': 'application/json'}, body: body);

    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(Utf8Decoder().convert(response.body.codeUnits));

      return ModelUsuario.fromJson(map);
    } else {
      throw Exception("Failed to load");
    }
  }
}
