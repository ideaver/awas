import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class CheckboxListTileWidget extends StatelessWidget {
  final String title;
  const CheckboxListTileWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: false,
      dense: true,
      checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      onChanged: (value) {},
      title: Text(
        title,
        style: LightColors.subTitle2TextStyle,
      ),
    );
  }
}
