import 'package:shared/src/modules/levantamentos/levantamento_repository.dart';

class LevantamentoModel {
  int idLevantamento;
  String dtVerificado;
  int idBem;

  LevantamentoModel({
    required this.idLevantamento,
    required this.dtVerificado,
    required this.idBem,
  });

  factory LevantamentoModel.fromJson(Map<String, dynamic> json) {
    return LevantamentoModel(
      idLevantamento: json['Id_levantamento'],
      dtVerificado: json['Dt_verificado'],
      idBem: json['Id_Bem'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id_levantamento'] = idLevantamento;
    data['Dt_verificado'] = dtVerificado;
    data['Id_Bem'] = idBem;
    return data;
  }

  static Future<List<LevantamentoModel>> getLevantamentos() async {
    return await LevantamentoRepository().getLevantamentos();
  }
}
