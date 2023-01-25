import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

class FormErrorWidget extends StatelessWidget {
  final List<String> errors;

  const FormErrorWidget({
    super.key,
    required this.errors,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        const Icon(
          Icons.highlight_off_rounded,
          color: LightColors.kDangerColor,
        ),
        const SizedBox(
          width: defaultMargin / 4,
        ),
        Text(error),
      ],
    );
  }
}
