import 'package:flutter/material.dart';

import '/res/theme/colors/light_colors.dart';
import 'kelevated_button.dart';

// ignore: must_be_immutable
class KfloatingActionButton extends StatelessWidget {
  void Function() onPressed;
  final String title;
  final Widget icon;
  KfloatingActionButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.icon = const SizedBox()});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom == 0.0
        ? Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: defaultMargin, vertical: defaultMargin * 2),
            child: KelevatedButtonWidget(
                icon: icon, title: title, onPressed: onPressed),
          )
        : const SizedBox();
  }
}
