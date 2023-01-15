import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class StarBadgeWidget extends StatelessWidget {
  const StarBadgeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/point-transactions');
      },
      child: Chip(
        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
        avatar: const Icon(
          Icons.star,
          color: LightColors.kWhiteColor,
          size: 20,
        ),
        elevation: 2,
        backgroundColor: LightColors.kTertiaryColor,
        label: Text(
          '3200',
          style: LightColors.subTitle2TextStyle.copyWith(
              fontWeight: FontWeight.bold,
              color: LightColors.kWhiteColor,
              fontSize: 12.0),
        ),
      ),
    );
  }
}
