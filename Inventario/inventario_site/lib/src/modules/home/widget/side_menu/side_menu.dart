import 'package:flutter/material.dart';
import 'package:shared/constantes/app_color.dart';
import 'package:shared/constantes/app_theme.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
    this.onTap1,
    this.onTap2,
    this.onTap3,
  }) : super(key: key);

  final VoidCallback? onTap1;
  final VoidCallback? onTap2;
  final VoidCallback? onTap3;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        color: AppColors.primary,
      ),
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                height: 30,
              )),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 8.0,
                      left: 20.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          )),
                      child: ListTile(
                        leading: Icon(
                          Icons.upload_rounded,
                          color: AppColors.secondary,
                        ),
                        title: Text(
                          'TESTE',
                          style: AppTheme.captionLight,
                        ),
                        onTap: onTap1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 8.0,
                      left: 20.0,
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.upload_rounded,
                        color: AppColors.secondary,
                      ),
                      title: Text('TESTE', style: AppTheme.captionLight),
                      onTap: onTap2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
