import 'package:shared/src/modules/levantamentos/levantamento_repository.dart';

class LevantamentoModel {
  int idLevantamento;
  String dtVerificado;
  String Status;
  int Id_local_verificado;
  int idBem;

  LevantamentoModel({
    required this.idLevantamento,
    required this.dtVerificado,
    required this.idBem,
    required this.Status,
    required this.Id_local_verificado,
  });

  factory LevantamentoModel.fromJson(Map<String, dynamic> json) {
    return LevantamentoModel(
      idLevantamento: json['Id_levantamento'],
      dtVerificado: json['Dt_verificado'],
      idBem: json['Id_Bem'],
      Status: json['Status'],
      Id_local_verificado: json['Id_local_verificado'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id_levantamento'] = idLevantamento;
    data['Dt_verificado'] = dtVerificado;
    data['Id_Bem'] = idBem;
    data['Status'] = Status;
    data['Id_local_verificado'] = Id_local_verificado;
    return data;
  }

  static Future<List<LevantamentoModel>> getLevantamentos() async {
    return await LevantamentoRepository().getLevantamentos();
  }
}
