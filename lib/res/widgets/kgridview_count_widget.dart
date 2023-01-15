import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class KgridviewCountWidget extends StatelessWidget {
  final List<Widget> children;
  const KgridviewCountWidget({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      crossAxisSpacing: defaultMargin,
      mainAxisSpacing: defaultMargin,
      childAspectRatio: 1.5,
      crossAxisCount: 2,
      children: children,
    );
  }
}
