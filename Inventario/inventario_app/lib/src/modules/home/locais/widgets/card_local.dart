import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventario_app/src/modules/home/locais/locais_controller.dart';
import 'package:lottie/lottie.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_text.dart';
import 'package:shared/shared.dart';

class CardLocal extends StatefulWidget {
  ModelLocal modelLocal;
  final AnimationController animationController;
  final Animation<double> animation;
  GlobalKey<ScaffoldState> scaffoldKey;
  int keyNumber;
  var onExpansionChanged;
  LocalController localController;
  bool initialExpanded;

  CardLocal({
    Key? key,
    required this.keyNumber,
    required this.initialExpanded,
    required this.localController,
    required this.onExpansionChanged,
    required this.modelLocal,
    required this.animationController,
    required this.animation,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  State<CardLocal> createState() => _CardLocalState();
}

class _CardLocalState extends State<CardLocal> {
  double length = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, _) {
        return FadeTransition(
          opacity: widget.animation,
          child: Transform(
              transform: Matrix4.translationValues(
                  100 * (1.0 - widget.animation.value), 0.0, 0.0),
              child: Theme(
                data: Theme.of(context)
                    .copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                    key: Key(widget.keyNumber.toString()),
                    initiallyExpanded: widget.initialExpanded,
                    onExpansionChanged: widget.onExpansionChanged,
                    collapsedIconColor: AppColors.grey,
                    iconColor: AppColors.primary,
                    tilePadding: EdgeInsets.zero,
                    title: SizedBox(
                      height: 70,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        child: AspectRatio(
                          aspectRatio: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            color: AppColors.backgroundCardColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(widget.modelLocal.dsLocal.toUpperCase(),
                                    style: AppText.textPrimaryCardLocalHome),
                                GestureDetector(
                                    onTap: () {
                                      if (widget.localController.patrimonios
                                          .isNotEmpty) {
                                        widget.localController.startScan(
                                            Id_Local:
                                                widget.modelLocal.idLocal!,
                                            Id_Levantamento: 1,
                                            Id_usuario:
                                                widget.modelLocal.idUsuario,
                                            scaffoldKey: widget.scaffoldKey,
                                            context: context);
                                      }
                                    },
                                    child: Container(
                                        height: 50,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.qr_code_scanner,
                                            color: AppColors.primary,
                                            size: 30,
                                          ),
                                        ))),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    children: [
                      Obx(() => widget.localController.loading.value
                          ? SizedBox(
                              height: 200,
                              child: Center(
                                  child: LottieBuilder.asset(
                                      'assets/loading_moveis.json')))
                          : widget.localController.patrimonios.isNotEmpty
                              ? SizedBox(
                                  height: widget
                                          .localController.patrimonios.length *
                                      40,
                                  width: MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                    padding: const EdgeInsets.only(
                                      right: 20,
                                    ),
                                    shrinkWrap: true,
                                    itemCount: widget
                                        .localController.patrimonios.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: _row(widget.localController
                                            .patrimonios[index]),
                                      );
                                    },
                                  ),
                                )
                              : const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Este local não possui patrimonios associados',
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ))
                    ]),
              )),
        );
      },
    );
  }

  _row(ModelPatrimonio patrimonio) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              patrimonio.encontrado!
                  ? Icons.check_circle_rounded
                  : Icons.check_circle_outlined,
              color: AppColors.primary
                  .withAlpha(patrimonio.encontrado! ? 150 : 50),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(" " + patrimonio.nmPatrimonio.toString(),
                style: AppText.textPrimaryCardNotificacaoHome),
          ),
          Expanded(
              flex: 9,
              child: Text(
                patrimonio.dsPatrimonio,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppText.textPrimaryCardNotificacaoHome,
              )),
        ],
      ),
    );
  }
}
