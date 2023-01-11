import 'package:flutter/material.dart';

import '/res/theme/colors/light_colors.dart';

// ignore: must_be_immutable
class KelevatedButtonWidget extends StatelessWidget {
  void Function() onPressed;
  final String title;
  final Color backgroundColor;
  final Color textColor;

  KelevatedButtonWidget({
    Key? key,
    required this.onPressed,
    required this.title,
    this.backgroundColor = LightColors.kPrimaryColor,
    this.textColor = LightColors.kWhiteColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 40,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              side: BorderSide(
                color: LightColors.kPrimaryColor,
              ),
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(defaultCircular / 2), // <-- Radius
              )),
          onPressed: onPressed,
          child: Text(
            title,
            style: LightColors.whiteTextStyle.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
