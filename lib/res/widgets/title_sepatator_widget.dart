import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../theme/colors/light_colors.dart';

class TitleSeparatorWidget extends StatelessWidget {
  final String title;
  const TitleSeparatorWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultMargin, vertical: defaultMargin / 2),
      color: LightColors.kGreyColor,
      child: Text(
        title.toUpperCase(),
        style: LightColors.subTitle2TextStyle
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
