import 'package:flutter/material.dart';

import '/res/theme/colors/light_colors.dart';
import 'kelevated_button.dart';

// ignore: must_be_immutable
class KfloatingActionButton extends StatelessWidget {
  void Function() onPressed;
  final String title;
  KfloatingActionButton(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom == 0.0
        ? Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: defaultMargin, vertical: defaultMargin * 2),
            child: KelevatedButtonWidget(title: title, onPressed: onPressed),
          )
        : const SizedBox();
  }
}
