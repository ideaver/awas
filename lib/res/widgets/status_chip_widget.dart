import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class statusChipWidget extends StatelessWidget {
  const statusChipWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Chip(
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          backgroundColor: LightColors.kBackgroundColor,
          // labelPadding:
          //     const EdgeInsets.symmetric(horizontal: 10),
          side: const BorderSide(color: LightColors.kSuccessColor),
          label: Text(
            'closed',
            style: LightColors.subTitle3TextStyle
                .copyWith(color: LightColors.kSuccessColor),
          )),
    );
  }
}
