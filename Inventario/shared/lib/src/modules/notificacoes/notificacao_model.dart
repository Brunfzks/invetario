import 'notificacao_repository.dart';

class ModelNotificacao {
  int idNotificacao;
  String dtNotificacao;
  int idBem;
  int idLocalOrigem;
  late int idUsuario;
  String dsPatrimonio;
  String usEcontrou;
  String lcEncontrado;
  String lcOrigem;

  ModelNotificacao({
    required this.idNotificacao,
    required this.dtNotificacao,
    required this.idBem,
    required this.dsPatrimonio,
    required this.usEcontrou,
    required this.lcEncontrado,
    required this.idLocalOrigem,
    required this.lcOrigem,
  });

  factory ModelNotificacao.fromJson(Map<String, dynamic> json) {
    return ModelNotificacao(
      idNotificacao: json['Id_notificacao'],
      dtNotificacao: json['Dt_notificacao'],
      idBem: json['Id_bem'],
      dsPatrimonio: json['Ds_patrimonio'],
      usEcontrou: json['Us_econtrou'],
      lcEncontrado: json['Lc_encontrado'],
      lcOrigem: json['Lc_origem'],
      idLocalOrigem: json['Id_local'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id_notificacao'] = idNotificacao;
    data['Dt_notificacao'] = dtNotificacao;
    data['Id_Bem'] = idBem;
    data['Id_usuario'] = idUsuario;
    return data;
  }

  static Future<List<ModelNotificacao>> getNotificacoes(
      {required int Id_Usuario}) async {
    return await NorificacaoRepository()
        .getNotificacoes(Id_Usuario: Id_Usuario);
  }
}
