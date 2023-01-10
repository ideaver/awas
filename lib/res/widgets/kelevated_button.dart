import 'package:flutter/material.dart';

import '/res/theme/colors/light_colors.dart';

// ignore: must_be_immutable
class KelevatedButtonWidget extends StatelessWidget {
  void Function() onPressed;
  final String title;
  final Color backgroundColor;

  KelevatedButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.backgroundColor = LightColors.kPrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(defaultCircular / 2), // <-- Radius
            )),
        onPressed: onPressed,
        child: Text(
          title,
          style: LightColors.whiteTextStyle,
        ),
      ),
    );
  }
}
