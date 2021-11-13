import 'package:shared/src/modules/patrimonios/patrimonio_repository.dart';
import 'package:shared/src/modules/levantamentos/levantamento_repository.dart';

class ModelPatrimonio {
  int? idBem;
  String dsRotulo;
  int? dsEd;
  String dsCampus;
  double vlPatrimonio;
  int nmPatrimonio;
  String dsPatrimonio;
  String nmNotaFiscal;
  String dtEntrada;
  String stConservacao;
  String nmSerie;
  String nmFornecedor;
  String? dtCarga;
  String dsMarca;
  int empenho;
  String tpIngresso;
  int idLocal;
  bool? encontrado;
  int idUsuario;

  ModelPatrimonio({
    required this.idUsuario,
    this.idBem,
    required this.dsRotulo,
    this.dsEd,
    required this.dsCampus,
    required this.vlPatrimonio,
    required this.nmPatrimonio,
    required this.dsPatrimonio,
    required this.nmNotaFiscal,
    required this.dtEntrada,
    required this.stConservacao,
    required this.nmSerie,
    required this.nmFornecedor,
    this.dtCarga,
    required this.dsMarca,
    required this.empenho,
    required this.tpIngresso,
    required this.idLocal,
    this.encontrado,
  });

  factory ModelPatrimonio.fromJson(Map<String, dynamic> json) {
    return ModelPatrimonio(
      idUsuario: json['Id_Usuario'],
      idBem: json['Id_Bem'],
      dsRotulo: json['Ds_rotulo'],
      dsEd: json['Ds_ed'],
      dsCampus: json['Ds_campus'],
      vlPatrimonio: double.tryParse(json['Vl_patrimonio'].toString()) ?? 0,
      nmPatrimonio: json['Nm_patrimonio'],
      dsPatrimonio: json['Ds_patrimonio'],
      nmNotaFiscal: json['Nm_nota_fiscal'],
      dtEntrada: json['Dt_entrada'],
      stConservacao: json['St_conservacao'],
      nmSerie: json['Nm_serie'],
      nmFornecedor: json['Nm_Fornecedor'],
      dtCarga: json['Dt_carga'],
      dsMarca: json['Ds_Marca'],
      empenho: json['Empenho'],
      tpIngresso: json['Tp_ingresso'],
      idLocal: json['Id_local'],
      encontrado: json['encontrado'] == 'true',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (idBem != null) data['Id_Bem'] = idBem;
    data['Ds_rotulo'] = dsRotulo;
    data['Ds_ed'] = dsEd;
    data['Ds_campus'] = dsCampus;
    data['Vl_patrimonio'] = vlPatrimonio;
    data['Nm_patrimonio'] = nmPatrimonio;
    data['Ds_patrimonio'] = dsPatrimonio;
    data['Nm_nota_fiscal'] = nmNotaFiscal;
    data['Dt_entrada'] = dtEntrada;
    data['St_conservacao'] = stConservacao;
    data['Nm_serie'] = nmSerie;
    data['Nm_Fornecedor'] = nmFornecedor;
    data['Dt_carga'] = dtCarga;
    data['Ds_Marca'] = dsMarca;
    data['Empenho'] = empenho;
    data['Tp_ingresso'] = tpIngresso;
    data['Id_local'] = idLocal;
    data['Id_Usuario'] = idUsuario;
    return data;
  }

  static Future<List<ModelPatrimonio>> getPatrimonios(
      {required int Id_local}) async {
    return await PatrimonioRepository().getPatrimonios(Id_local: Id_local);
  }

  static Future<List<ModelPatrimonio>> getAllPatrimonios(
      ) async {
    return await PatrimonioRepository().getAllPatrimonios();
  }

  static Future<List<ModelPatrimonio>> relatorioNaoEncontrado() async {
    return await PatrimonioRepository().relatorioNaoEncontrado();
  }

  static Future<int> cadastraPatrimonio(ModelPatrimonio patrimonio) async {
    return await PatrimonioRepository().cadastraPatrimonios(patrimonio);
  }

  static Future<String> insertLevantamento(
      {required int Id_Local,
      required int Nm_Patrimonio,
      required int Id_Levantamento,
      required int Id_usuario,
      required bool notificacao,
      required String status}) async {
    return await LevantamentoRepository().InsertLevantamento(
        Id_Local: Id_Local,
        Nm_Patrimonio: Nm_Patrimonio,
        Id_Levantamento: Id_Levantamento,
        Id_usuario: Id_usuario,
        notificacao: notificacao,
        status: status);
  }
}
