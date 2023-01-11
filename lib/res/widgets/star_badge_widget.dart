import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class StarBadgeWidget extends StatelessWidget {
  const StarBadgeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(
        Icons.star_outline,
        color: LightColors.kWhiteColor,
      ),
      elevation: 2,
      backgroundColor: LightColors.kTertiaryColor,
      labelPadding: const EdgeInsets.only(left: 5, right: defaultMargin),
      label: Text(
        '3200',
        style: LightColors.subTitle2TextStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: LightColors.kWhiteColor,
            fontSize: 12.0),
      ),
    );
  }
}
