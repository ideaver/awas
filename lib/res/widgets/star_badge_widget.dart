import 'package:awas/view/user/point_transactions_page.dart';
import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

// ignore: must_be_immutable
class StarBadgeWidget extends StatelessWidget {
  StarBadgeWidget({
    Key? key,
  }) : super(key: key);

  bool rightMargin = false;

  // ignore: use_key_in_widget_constructors
  StarBadgeWidget.rightMargin() {
    rightMargin = true;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, PointTransactionsPage.viewAsMeRouteName);
      },
      child: Chip(
        labelPadding:
            EdgeInsets.only(left: 5, right: rightMargin ? defaultMargin : 5),
        visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
        avatar: const Icon(
          Icons.star,
          color: LightColors.kWhiteColor,
          size: 20,
        ),
        elevation: 2,
        backgroundColor: LightColors.kTertiaryColor,
        labelStyle: LightColors.subTitle2TextStyle.copyWith(
            fontWeight: FontWeight.bold,
            color: LightColors.kWhiteColor,
            fontSize: 12.0),
        label: const Text(
          '3200',
        ),
      ),
    );
  }
}
