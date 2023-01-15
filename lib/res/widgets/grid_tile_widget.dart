import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';
import 'kcard_widget.dart';

class GridTileWidget extends StatelessWidget {
  final bool selected;
  final String title;
  final IconData icon;
  final void Function() onTap;

  const GridTileWidget({
    Key? key,
    this.selected = false,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KcardWidget(
        padding: const EdgeInsets.all(0.0),
        onTap: onTap,
        elevation: 0.0,
        color: LightColors.kWhiteColor,
        borderColor: selected
            ? LightColors.kPrimaryColor
            : LightColors.kDarkGreyColor.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: selected
                  ? LightColors.kPrimaryColor
                  : LightColors.kDarkGreyColor,
              size: 35,
            ),
            const SizedBox(
              height: defaultMargin / 2,
            ),
            Text(
              title,
              style: LightColors.subTitle3TextStyle
                  .copyWith(color: LightColors.kDarkGreyColor),
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
