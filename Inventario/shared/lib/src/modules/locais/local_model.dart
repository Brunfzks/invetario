import 'package:shared/src/modules/locais/local_repository.dart';

class ModelLocal {
  int? idLocal;
  String dsLocal;
  int idUsuario;

  ModelLocal({
    required this.idLocal,
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

  static Future<List<ModelLocal>> getLocais() async {
    return await LocalRepository().getLocais();
  }
}
