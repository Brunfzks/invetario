import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_app/src/modules/home/locais/locais_controller.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';
import 'package:shared/shared.dart';

class CardLocal extends StatelessWidget {
  ModelLocal modelLocal;
  final AnimationController animationController;
  final Animation<double> animation;
  double length = 0;
  final LocalController localController = Get.put(LocalController());

  CardLocal(
      {required this.modelLocal,
      required this.animationController,
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
              child: Obx(() => Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                        onExpansionChanged: (e) {
                          localController.loading.value = true;

                          localController
                              .getPatrimonios(Id_local: modelLocal.idLocal!)
                              .then((value) {
                            length = double.parse(
                                localController.patrimonios.length.toString());
                          });
                        },
                        collapsedIconColor: AppColors.grey,
                        iconColor: AppColors.primary,
                        tilePadding: EdgeInsets.zero,
                        title: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          child: AspectRatio(
                            aspectRatio: 8,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              color: AppColors.backgroundCardColor,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(modelLocal.dsLocal.toUpperCase(),
                                      style: AppText.textPrimaryCardLocalHome),
                                  GestureDetector(
                                    onTap: () {
                                      localController.startScan(
                                          Id_Local: modelLocal.idLocal!,
                                          Id_Levantamento: 1,
                                          Id_usuario: modelLocal.idUsuario);
                                    },
                                    child: Icon(
                                      Icons.qr_code_scanner,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        children: [
                          localController.loading.value
                              ? const SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: Center(
                                      child: CircularProgressIndicator()))
                              : length > 0
                                  ? SizedBox(
                                      height: 40 * length,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                        padding: const EdgeInsets.only(
                                          right: 20,
                                        ),
                                        shrinkWrap: true,
                                        itemCount:
                                            localController.patrimonios.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                right: 20),
                                            child: _row(localController
                                                .patrimonios[index]),
                                          );
                                        },
                                      ),
                                    )
                                  : const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Esta sala não possui patrimonios associados',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                    )
                        ]),
                  )),
            ));
      },
    );
  }

  _row(ModelPatrimonio patrimonio) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            patrimonio.nmPatrimonio.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              letterSpacing: 0.27,
              color: AppColors.darkerText,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            patrimonio.dsPatrimonio,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              letterSpacing: 0.27,
              color: AppColors.darkerText,
            ),
          ),
        ],
      ),
    );
  }
}
