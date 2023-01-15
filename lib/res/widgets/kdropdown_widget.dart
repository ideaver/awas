import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:awas/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

class KdropdownWidget extends StatefulWidget {
  final String title;
  const KdropdownWidget({Key? key, required this.title}) : super(key: key);

  @override
  KdropdownWidgetState createState() => KdropdownWidgetState();
}

class KdropdownWidgetState extends State<KdropdownWidget> {
  final jobRoleCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: LightColors.subTitle2TextStyle.copyWith(fontSize: 16),
        ),
        const SizedBox(
          height: defaultMargin / 3,
        ),
        CustomDropdown(
          fillColor: LightColors.kGreyColor,
          hintText: 'Select job role',
          items: const ['Developer', 'Designer', 'Consultant', 'Student'],
          controller: jobRoleCtrl,
          borderRadius: kBorderRadius / 3,
        ),
      ],
    );
  }
}
