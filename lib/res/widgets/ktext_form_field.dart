import 'package:flutter/services.dart';

import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

class KtextFormFieldWidget extends StatelessWidget {
  final bool obscureText;
  final String? title;
  final IconData? icon;
  final bool withTitle;
  final bool editable;
  final Widget? suffix;
  final int? minLines;
  final bool withCounterText;
  final bool withEnterText;
  final Color borderSideColor;
  final Color? fillColor;
  final TextStyle? labelStyle;
  final TextEditingController? controller;
  final void Function(String value)? onFieldSubmitted;
  final void Function(String value)? onChanged;
  final EdgeInsets? fieldMargin;
  final EdgeInsets? contentPadding;
  final double fontSize;
  final TextAlign? textAlign;
  final String? hintText;
  final TextStyle? style;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const KtextFormFieldWidget({
    this.editable = true,
    this.withTitle = true,
    this.title,
    this.icon,
    super.key,
    this.controller,
    this.suffix,
    this.onFieldSubmitted,
    this.onChanged,
    this.obscureText = false,
    this.minLines,
    this.withCounterText = false,
    this.withEnterText = true,
    this.borderSideColor = LightColors.kGreyColor,
    this.fillColor,
    this.labelStyle,
    this.fieldMargin,
    this.contentPadding,
    this.fontSize = 16,
    this.textAlign,
    this.hintText,
    this.style,
    this.keyboardType,
    this.inputFormatters,
  });

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
            ),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return withTitle
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? '',
                style: labelStyle ??
                    LightColors.subTitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
              ),
              field(),
            ],
          )
        : field();
  }

  Widget field() {
    return Padding(
      padding: fieldMargin ?? const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: obscureText,
        readOnly: editable ? false : true,
        minLines: minLines,
        maxLines: minLines ?? 0 + 1,
        style: style ??
            LightColors.subTitleTextStyle.copyWith(
              fontSize: fontSize,
              fontWeight: FontWeight.w900,
            ),
        textAlign: textAlign ?? TextAlign.start,
        keyboardType: keyboardType ?? TextInputType.text,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          isDense: true,
          // counter: null,
          counterStyle: LightColors.subTitle2TextStyle,
          counterText: withCounterText ? '1230 Char' : null,
          prefixIcon: icon != null
              ? Icon(
                  icon,
                  color: LightColors.kBlackColor,
                )
              : null,
          suffixIcon: suffix,
          filled: true,
          fillColor: editable
              ? (fillColor ?? LightColors.kGreyColor)
              : LightColors.kDarkGreyColor.withOpacity(0.5),
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                vertical: minLines != null ? defaultMargin : 0.0,
                horizontal: defaultMargin,
              ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultCircular - 10),
            borderSide: BorderSide(color: borderSideColor),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(defaultCircular - 10),
            // borderSide: const BorderSide(
            //   color: LightColors.kBlackColor,
            // ),
          ),
          hintText: hintText ??
              (withEnterText
                  ? title != null
                      ? 'Enter $title'
                      : title
                  : ''),
          hintMaxLines: 2,
          hintStyle:
              LightColors.subTitleTextStyle.copyWith(fontSize: fontSize - 2),
          focusColor: LightColors.kPrimaryColor,
        ),
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChanged,
      ),
    );
  }
}
