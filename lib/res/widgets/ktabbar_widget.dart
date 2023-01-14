import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class KtabBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final TabController controller;
  final List<String> titles;
  const KtabBarWidget({
    Key? key,
    required this.controller,
    required this.titles,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(60.0);
  @override
  State<KtabBarWidget> createState() => _KtabBarWidgetState();
}

class _KtabBarWidgetState extends State<KtabBarWidget> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {
        //refresh
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
        padding: const EdgeInsets.all(defaultMargin / 2),
        controller: widget.controller,
        indicatorPadding:
            const EdgeInsets.symmetric(horizontal: defaultMargin / 2),
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: LightColors.kPrimaryColor.withOpacity(0.2)),
        splashBorderRadius: BorderRadius.circular(defaultCircular),
        labelPadding: const EdgeInsets.symmetric(
            horizontal: defaultMargin, vertical: defaultMargin / 2),
        tabs: widget.titles.map((e) {
          bool selected = widget.controller.index != widget.titles.indexOf(e);

          return Text(e,
              style: LightColors.linkTextStyle.copyWith(
                  color: selected ? LightColors.kDarkGreyColor : null,
                  fontSize: 14.0,
                  fontWeight: !selected ? FontWeight.bold : null));
        }).toList());
  }
}
