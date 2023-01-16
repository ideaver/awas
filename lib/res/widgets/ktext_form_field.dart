import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

class KtextFormFieldWidget extends StatelessWidget {
  final bool obscureText;
  final String title;
  final IconData? icon;
  final bool withTitle;
  final bool editable;
  final Widget? suffix;
  final int? minLines;
  final TextEditingController? controller;
  final void Function(String value)? onFieldSubmitted;
  final void Function(String value)? onChanged;

  const KtextFormFieldWidget(
      {this.editable = true,
      this.withTitle = true,
      required this.title,
      this.icon,
      super.key,
      this.controller,
      this.suffix,
      this.onFieldSubmitted,
      this.onChanged,
      this.obscureText = false,
      this.minLines});

  // ignore: use_key_in_widget_constructors
  KtextFormFieldWidget.password(
      {required String title, void Function()? onPressed})
      : this(
            title: title,
            obscureText: true,
            suffix: IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.visibility,
                  color: LightColors.kBlackColor,
                )));

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
          obscureText: obscureText,
          readOnly: editable ? false : true,
          minLines: minLines,
          maxLines: minLines ?? 0 + 1,
          style: LightColors.subTitleTextStyle
              .copyWith(fontSize: 16, fontWeight: FontWeight.w900),
          decoration: InputDecoration(
              counterStyle: LightColors.subTitle2TextStyle,
              counterText: '1230 Char',
              prefixIcon: icon != null
                  ? Icon(
                      icon,
                      color: LightColors.kBlackColor,
                    )
                  : null,
              suffixIcon: suffix,
              filled: true,
              fillColor: editable
                  ? LightColors.kGreyColor
                  : LightColors.kDarkGreyColor.withOpacity(0.5),
              contentPadding: EdgeInsets.symmetric(
                  vertical: minLines != null ? defaultMargin : 0.0,
                  horizontal: defaultMargin),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(defaultCircular - 10),
                  borderSide: const BorderSide(color: LightColors.kGreyColor)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultCircular - 10),
                // borderSide:
                //     const BorderSide(color: LightColors.kDarkGreyColor)
              ),
              hintText: 'Enter $title',
              hintMaxLines: 2,
              hintStyle: LightColors.subTitleTextStyle.copyWith(fontSize: 14),
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
