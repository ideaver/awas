import 'package:awas/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

class KtextFormField extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool withTitle;
  final bool editable;
  final Widget? prefix;
  final TextEditingController? controller;
  final void Function(String value)? onFieldSubmitted;
  final void Function(String value)? onChanged;

  const KtextFormField(
      {this.editable = true,
      this.withTitle = true,
      required this.title,
      this.icon,
      super.key,
      this.controller,
      this.prefix,
      this.onFieldSubmitted,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        withTitle
            ? Text(
                title,
                style: LightColors.subTitleTextStyle.copyWith(fontSize: 16),
              )
            : Container(),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          readOnly: editable ? false : true,
          style: LightColors.subTitleTextStyle.copyWith(fontSize: 16),
          decoration: InputDecoration(
              prefix: prefix,
              suffixIcon: icon != null
                  ? Icon(
                      icon,
                      color: LightColors.kPrimaryColor,
                    )
                  : null,
              filled: true,
              fillColor: editable
                  ? LightColors.kGreyColor
                  : LightColors.kDarkGreyColor.withOpacity(0.5),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultCircular - 10),
                  borderSide:
                      const BorderSide(color: LightColors.kDarkGreyColor)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultCircular - 10),
                  borderSide:
                      const BorderSide(color: LightColors.kDarkGreyColor)),
              hintText: 'Masukkan $title',
              hintMaxLines: 2,
              hintStyle: LightColors.subTitleTextStyle.copyWith(
                  fontSize: 14,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold),
              focusColor: LightColors.kPrimaryColor),
          controller: controller,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
