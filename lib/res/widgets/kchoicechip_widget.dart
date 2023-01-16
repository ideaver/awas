import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class KchoiceChipWidget extends StatelessWidget {
  final bool selected;
  const KchoiceChipWidget({
    Key? key,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultMargin / 4),
      child: ChoiceChip(
          onSelected: (value) {},
          avatar: selected
              ? const Icon(
                  Icons.check,
                  color: LightColors.kPrimaryColor,
                )
              : null,
          labelStyle:
              selected ? LightColors.linkTextStyle : LightColors.blackTextStyle,
          selectedColor: LightColors.kPrimaryColor.withOpacity(0.1),
          disabledColor: LightColors.kGreyColor,
          label: const Text(
            'Terbentur',
          ),
          selected: selected),
    );
  }
}
