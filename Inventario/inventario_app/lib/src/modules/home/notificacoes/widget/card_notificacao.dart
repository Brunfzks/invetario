import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_app/src/modules/home/locais/locais_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/shared.dart';

import '../../home_controller.dart';

class CardNotificacao extends StatelessWidget {
  ModelNotificacao modelNotificacao;
  final AnimationController animationController;
  final Animation<double> animation;
  GlobalKey<ScaffoldState> scaffoldKey;
  final LocalController localController = Get.put(LocalController());
  final HomeController homeController = Get.find();

  CardNotificacao(
      {required this.modelNotificacao,
      required this.animationController,
      required this.scaffoldKey,
      required this.animation,
      Key? key})
      : super(key: key);

  _qrIcon(context) {
    return GestureDetector(
      onTap: () {
        localController
            .startScan(
                Id_Local: modelNotificacao.idLocalOrigem,
                Id_Levantamento: 1,
                Id_usuario: modelNotificacao.idUsuario,
                scaffoldKey: scaffoldKey,
                notificacao: true,
                context: context)
            .then((v) {
          homeController.getNotificacoes();
        });
      },
      child: Container(
        height: 70,
        width: 70,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: LottieBuilder.asset('assets/qr_code.json')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, _) {
        return FadeTransition(
            opacity: animation,
            child: Transform(
              transform: Matrix4.translationValues(
                  100 * (1.0 - animation.value), 0.0, 0.0),
              child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundCardNotificacaoColor,
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  ),
                  width: 320,
                  child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            modelNotificacao.dsPatrimonio,
                            textAlign: TextAlign.left,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Localizado por',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            letterSpacing: 0.27,
                                            color: AppColors.grey,
                                          ),
                                        ),
                                        _rowInfo(Icons.person,
                                            modelNotificacao.usEcontrou),
                                        const SizedBox(
                                          height: 4,
                                        ),
                                        _rowInfo(
                                            Icons.update,
                                            _formataData(modelNotificacao
                                                .dtNotificacao)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ]),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [_qrIcon(context)]),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            'Localização',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 0.27,
                              color: AppColors.grey,
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: _rowInfo(Icons.location_on,
                                    modelNotificacao.lcEncontrado),
                              ),
                              Expanded(
                                  flex: 5,
                                  child: _rowInfo(
                                      Icons.anchor, modelNotificacao.lcOrigem)),
                            ],
                          )
                        ],
                      ))),
            ));
      },
    );
  }

  Widget _rowInfo(icon, desc) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Container(
            height: 25,
            width: 25,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            child: Icon(
              icon,
              size: 20,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            flex: 8,
            child: Text(
              desc,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 11,
                letterSpacing: 0.27,
                color: AppColors.darkerText,
              ),
            ),
          )
        ],
      ),
    );
  }
}

_formataData(String dtNotificacao) {
  return formatDate(DateTime.parse(dtNotificacao),
      [d, '/', mm, '/', yy, ' ás ', HH, ':', nn, ':', ss]);
}
