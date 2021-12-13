  import 'package:shared/src/modules/cab_levantamentos/cab_levantamento_repository.dart';

class CabLevantamentoModel {
  int? idCabLevantamento;
  String? dtLancamento;
  int? encerrado;
  int? idUsuario;

  CabLevantamentoModel({
     this.idCabLevantamento,
     this.dtLancamento,
     this.encerrado,
     this.idUsuario,
  });

  factory CabLevantamentoModel.fromJson(Map<String, dynamic> json) {
    return CabLevantamentoModel(
      idCabLevantamento: json['Id_levantamento'],
      dtLancamento: json['Dt_Levantamento'],
      encerrado: json['Encerrado'],
      idUsuario: json['id_Usuario'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id_levantamento'] = idCabLevantamento;
    data['Dt_Levantamento'] = dtLancamento;
    data['Encerrado'] = encerrado;
    data['id_Usuario'] = idUsuario;

    return data;
  }

  static Future<CabLevantamentoModel> getLevantamentos() async {
    return await CabLevantamentoRepository().getCabLevantamento();
  }

  static Future<String> atualizaLevantamentos(int idusuario, bool excluir, encerrado) async {
    return await CabLevantamentoRepository().atualizaLevantamento(idusuario, excluir, encerrado);
  }

}
