import 'package:flutter/material.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/shared.dart';

class CardLocal extends StatelessWidget {
  ModelLocal modelLocal;
  final AnimationController animationController;
  final Animation<double> animation;

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
              child: SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width -40,
                child: Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
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
                        _row('258484', 'Mesa redonda'),
                        _row('358964', 'Cadeira Giratoria'),
                      ],
                    )),
              )),
        );
      },
    );
  }

  _row(text, text2) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            text,
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
            text2,
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
