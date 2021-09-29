import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_app/src/modules/home/locais/locais_controller.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';
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
            child: GestureDetector(
                onTap: () => {},
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgroundCardColor,
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  ),
                  width: 320,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          modelNotificacao.dsPatrimonio,
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            letterSpacing: 0.27,
                            color: AppColors.darkerText,
                          ),
                        ),
                      ),
                      Row(children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: SizedBox(
                            height: 80,
                            width: 50,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: AspectRatio(
                                  aspectRatio: 1.0,
                                  child: Container(
                                      color: AppColors.primary.withAlpha(200),
                                      padding: const EdgeInsets.only(
                                        left: 16,
                                        top: 8,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Encontrado por',
                                              style: AppText
                                                  .textPrimaryCardNotificacaoHome),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(modelNotificacao.usEcontrou,
                                              style: AppText
                                                  .textSecondCardNotificacaoHome),
                                        ],
                                      ))),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                            flex: 5,
                            child: Row(children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 16,
                                    bottom: 8,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Localização',
                                              textAlign: TextAlign.left,
                                              style: AppText
                                                  .textPrimaryCardNotificacaoHome),
                                          GestureDetector(
                                            onTap: () {
                                              localController
                                                  .startScan(
                                                      Id_Local: modelNotificacao
                                                          .idLocalOrigem,
                                                      Id_Levantamento: 1,
                                                      Id_usuario:
                                                          modelNotificacao
                                                              .idUsuario,
                                                      scaffoldKey: scaffoldKey,
                                                      notificacao: true,
                                                      context: context)
                                                  .then((v) {
                                                homeController
                                                    .getNotificacoes();
                                              });
                                            },
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0)),
                                              ),
                                              child: const Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Icon(
                                                  Icons.qr_code,
                                                  color: Color(0xff4ea53d),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                          'atual: ${modelNotificacao.lcEncontrado}',
                                          textAlign: TextAlign.left,
                                          style: AppText
                                              .textSecondCardNotificacaoHome),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                          'Origem: ${modelNotificacao.lcOrigem}',
                                          textAlign: TextAlign.left,
                                          style: AppText
                                              .textSecondCardNotificacaoHome),
                                    ],
                                  ),
                                ),
                              )
                            ])),
                      ]),
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}
