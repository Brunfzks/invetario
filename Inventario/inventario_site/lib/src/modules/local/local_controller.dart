import 'package:shared/shared.dart';

class LocalController {
  List<ModelLocal> locais = [];

  Future<List<ModelLocal>> getLocais() async {
    locais = await ModelLocal.getLocais();
    return locais;
  }
}
