import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_app/src/modules/home/locais/locais_controller.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/shared.dart';

class CardLocal extends StatelessWidget {
  ModelLocal modelLocal;
  final AnimationController animationController;
  final Animation<double> animation;

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


                          localController.getPatrimonios(
                              Id_local: modelLocal.idLocal!);
                        },
                        tilePadding: EdgeInsets.zero,
                        title: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          child: AspectRatio(
                            aspectRatio: 8,
                            child: Container(
                              color: AppColors.primary.withAlpha(50),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const Icon(Icons.location_on_outlined),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    modelLocal.dsLocal,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      letterSpacing: 0.27,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        children: [
                          Obx(() => localController.loading.value
                              ? const SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: Center(
                                      child: CircularProgressIndicator()))
                              : ListView.builder(
                                  padding: const EdgeInsets.only(
                                    right: 20,
                                  ),
                                  shrinkWrap: true,
                                  itemCount: localController.patrimonios.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final int count =
                                        localController.patrimonios.length > 10
                                            ? 10
                                            : localController
                                                .patrimonios.length;

                                    final Animation<double> animation =
                                        Tween<double>(begin: 0.0, end: 1.0)
                                            .animate(CurvedAnimation(
                                                parent: animationController,
                                                curve: Interval(
                                                    (1 / count) * index, 1.0,
                                                    curve:
                                                        Curves.fastOutSlowIn)));

                                    animationController.forward();

                                    return Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: _row(
                                          localController.patrimonios[index]),
                                    );
                                  },
                                ))
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
              fontSize: 14,
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
              fontSize: 14,
              letterSpacing: 0.27,
              color: AppColors.darkerText,
            ),
          ),
        ],
      ),
    );
  }
}
