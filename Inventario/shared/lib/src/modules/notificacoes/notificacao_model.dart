import 'notificacao_repository.dart';

class ModelNotificacao {
  int idNotificacao;
  String dtNotificacao;
  String dsLocalOrigem;
  String dsLocalAtual;
  String dsItem;
  int idBem;
  int idUsuario;

  ModelNotificacao(
      {required this.idNotificacao,
      required this.dtNotificacao,
      required this.idBem,
      required this.idUsuario,
      required this.dsItem,
      required this.dsLocalAtual,
      required this.dsLocalOrigem});

  factory ModelNotificacao.fromJson(Map<String, dynamic> json) {
    return ModelNotificacao(
      dsItem: json['Ds_item'],
      dsLocalAtual: json['Ds_LocalAtual'],
      dsLocalOrigem: json['Ds_LocalOrigem'],
      idNotificacao: json['Id_notificacao'],
      dtNotificacao: json['Dt_notificacao'],
      idBem: json['Id_Bem'],
      idUsuario: json['Id_usuario'],
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

  static Future<List<ModelNotificacao>> getNotificacoes() async {
    return await NorificacaoRepository().getNotificacoes();
  }
}
