import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';
import 'grid_tile_widget.dart';

class ReportCategoryGridWidget extends StatefulWidget {
  const ReportCategoryGridWidget({super.key});

  @override
  State<ReportCategoryGridWidget> createState() =>
      _ReportCategoryGridWidgetState();
}

class _ReportCategoryGridWidgetState extends State<ReportCategoryGridWidget> {
  int selectedIndex = 0;

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
      children: [
        GridTileWidget(
            selected: selectedIndex == 1,
            title: 'Safe Observation',
            icon: Icons.policy,
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
            }),
        GridTileWidget(
            selected: selectedIndex == 2,
            title: 'Unsafe Observation',
            icon: Icons.error,
            onTap: () {
              setState(() {
                selectedIndex = 2;
              });
            }),
        GridTileWidget(
            selected: selectedIndex == 3,
            title: 'Near Miss',
            icon: Icons.healing,
            onTap: () {
              setState(() {
                selectedIndex = 3;
              });
            }),
        GridTileWidget(
            selected: selectedIndex == 4,
            title: 'HIPO',
            icon: Icons.person_outline,
            onTap: () {
              setState(() {
                selectedIndex = 4;
              });
            })
      ],
    );
  }
}
