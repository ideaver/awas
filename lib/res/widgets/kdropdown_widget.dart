import 'package:animated_custom_dropdown/custom_dropdown.dart';
import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

class KdropdownWidget extends StatefulWidget {
  final String? title;
  final String? hintText;
  final Color? fillColor;
  final BorderRadius? borderRadius;
  final TextStyle? titleStyle;
  final TextStyle? hintStyle;
  final TextStyle? selectedStyle;
  final bool excludeSelected;
  final Widget? fieldSuffixIcon;
  final List<String>? items;
  final TextEditingController? controller;

  const KdropdownWidget({
    Key? key,
    this.title,
    this.hintText,
    this.items,
    this.fillColor,
    this.borderRadius,
    this.titleStyle,
    this.hintStyle,
    this.selectedStyle,
    this.excludeSelected = false,
    this.fieldSuffixIcon,
    this.controller,
  }) : super(key: key);

  @override
  KdropdownWidgetState createState() => KdropdownWidgetState();
}

class KdropdownWidgetState extends State<KdropdownWidget> {
  final jobRoleCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return widget.title != null
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title!,
                style: widget.titleStyle ??
                    LightColors.subTitle2TextStyle.copyWith(fontSize: 16),
              ),
              const SizedBox(
                height: defaultMargin / 3,
              ),
              dropDown()
            ],
          )
        : dropDown();
  }

  Widget dropDown() {
    return CustomDropdown(
      fillColor: widget.fillColor ?? LightColors.kGreyColor,
      hintText: widget.hintText,
      items: widget.items,
      controller: widget.controller ?? jobRoleCtrl,
      borderRadius: widget.borderRadius ?? BorderRadius.circular(100),
      hintStyle: widget.hintStyle ??
          LightColors.whiteTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
      selectedStyle: widget.selectedStyle ??
          LightColors.whiteTextStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
      excludeSelected: widget.excludeSelected,
      fieldSuffixIcon: widget.fieldSuffixIcon ??
          const Icon(
            Icons.arrow_drop_down,
            color: LightColors.kBackgroundColor,
          ),
    );
  }
}
