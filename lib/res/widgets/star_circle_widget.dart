import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../theme/colors/light_colors.dart';

class StarCircleWidget extends StatelessWidget {
  final double? height;
  final Color? color;
  const StarCircleWidget({super.key, this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultMargin / 3),
      decoration: BoxDecoration(
          color: color ?? LightColors.kTertiaryColor, shape: BoxShape.circle),
      child: Icon(
        Icons.star,
        color: LightColors.kWhiteColor,
        size: height,
      ),
    );
  }
}
