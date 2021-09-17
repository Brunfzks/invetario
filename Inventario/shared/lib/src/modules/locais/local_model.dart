import 'package:shared/src/modules/locais/local_repository.dart';

class ModelLocal {
  int? idLocal;
  String dsLocal;
  int idUsuario;

  ModelLocal({
    this.idLocal,
    required this.dsLocal,
    required this.idUsuario,
  });

  factory ModelLocal.fromJson(Map<String, dynamic> json) {
    return ModelLocal(
      idLocal: json['Id_local'],
      dsLocal: json['Ds_local'],
      idUsuario: json['Id_usuario'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id_local'] = idLocal;
    data['Ds_local'] = dsLocal;
    data['Id_usuario'] = idUsuario;
    return data;
  }

  Map<String, dynamic> toJsonInsert() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Ds_local'] = dsLocal;
    data['Id_usuario'] = idUsuario;
    return data;
  }

  static Future<List<ModelLocal>> getLocais(int Id_Usuario) async {
    return await LocalRepository().getLocais(Id_Usuario);
  }

  static Future<int> cadastraLocais(ModelLocal local) async {
    return await LocalRepository().cadastraLocais(local);
  }
}
