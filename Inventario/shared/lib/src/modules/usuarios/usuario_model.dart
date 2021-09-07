import 'package:shared/src/modules/usuarios/usuario_repository.dart';

class ModelUsuario {
  int? idUsuario;
  String snUsuario;
  String cpOrigem;
  String dsSetor;
  String ptUsuario;

  String nmUsuario;

  ModelUsuario(
      {this.idUsuario,
      required this.snUsuario,
      required this.cpOrigem,
      required this.dsSetor,
      required this.ptUsuario,
      required this.nmUsuario});

  factory ModelUsuario.fromJson(Map<String, dynamic> json) {
    return ModelUsuario(
      idUsuario: json['Id_usuario'],
      snUsuario: json['Sn_usuario'],
      cpOrigem: json['Cp_origem'],
      dsSetor: json['Ds_setor'],
      ptUsuario: json['Pt_usuario'],
      nmUsuario: json['Nm_usuario'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, String>{};
    idUsuario != null ? data['Id_usuario'] = idUsuario : null;
    data['Sn_usuario'] = snUsuario;
    data['Cp_origem'] = cpOrigem;
    data['Ds_setor'] = dsSetor;
    data['Pt_usuario'] = ptUsuario;
    data['Nm_usuario'] = nmUsuario;
    return data;
  }

  static Future<List<ModelUsuario>> getUsuarios() async {
    return await UsuarioRepository().getUsuarios();
  }

  static Future<int> cadastraUsuario(ModelUsuario novoUsuario) async {
    try {
      return await UsuarioRepository().cadastraUsuario(novoUsuario);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<ModelUsuario> getUsuario(String usuario, String senha) async {
    try {
      return await UsuarioRepository()
          .getUsuario(usuario: usuario, senha: senha);
    } catch (e) {
      throw Exception(e);
    }
  }
}
