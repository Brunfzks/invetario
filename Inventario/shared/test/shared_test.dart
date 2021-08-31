import 'package:flutter_test/flutter_test.dart';

import 'package:shared/shared.dart';
import 'package:shared/src/modules/levantamentos/levantamento_model.dart';
import 'package:shared/src/modules/levantamentos/levantamento_repository.dart';
import 'package:shared/src/modules/locais/local_repository.dart';
import 'package:shared/src/modules/notificacoes/notificacao_model.dart';
import 'package:shared/src/modules/notificacoes/notificacao_repository.dart';
import 'package:shared/src/modules/patrimonios/patrimonio_model.dart';
import 'package:shared/src/modules/patrimonios/patrimonio_repository.dart';
import 'package:shared/src/modules/usuarios/usuario_model.dart';
import 'package:shared/src/modules/usuarios/usuario_repository.dart';

void main() {
  ModelUsuario usuarioTeste = ModelUsuario(
      snUsuario: '123456',
      cpOrigem: 'São Paulo',
      dsSetor: 'Professor',
      nmUsuario: 'Lucas');
  group('Get', () {
    test('Get Locais', () async {
      final locais = await LocalRepository().getLocais();
      expect(locais, isA<List<ModelLocal>>());
    });
    test('Get Usuarios', () async {
      final usuarios = await UsuarioRepository().getUsuarios();
      expect(usuarios, isA<List<ModelUsuario>>());
    });
    test('Get Patrimonio', () async {
      final patrimonio = await PatrimonioRepository().getPatrimonios();
      expect(patrimonio, isA<List<PatrimonioModel>>());
    });
    test('Get Levantamentos', () async {
      final patrimonio = await LevantamentoRepository().getLevantamentos();
      expect(patrimonio, isA<List<LevantamentoModel>>());
    });
    test('Get Notificacoes', () async {
      final patrimonio = await NorificacaoRepository().getNotificacoes();
      expect(patrimonio, isA<List<NotificacaoModel>>());
    });
  });

  group('Insert', () {
    test('Insert Usuario', () async {
      final patrimonio =
          await UsuarioRepository().cadastraUsuario(usuarioTeste);
      expect(patrimonio, isA<int>());
    });
  });
}
