import '/res/widgets/kgridview_count_widget.dart';
import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';
import 'grid_tile_widget.dart';

class RiskLevelGridWidget extends StatefulWidget {
  const RiskLevelGridWidget({super.key});

  @override
  State<RiskLevelGridWidget> createState() => _RiskLevelGridWidgetState();
}

class _RiskLevelGridWidgetState extends State<RiskLevelGridWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return KgridviewCountWidget(
      children: [
        GridTileWidget(
            selected: selectedIndex == 1,
            title: 'Low',
            icon: Icons.insert_emoticon,
            onTap: () {
              setState(() {
                selectedIndex = 1;
              });
            }),
        GridTileWidget(
            selected: selectedIndex == 2,
            title: 'Medium',
            icon: Icons.sentiment_neutral,
            onTap: () {
              setState(() {
                selectedIndex = 2;
              });
            }),
        GridTileWidget(
            selected: selectedIndex == 3,
            title: 'High',
            icon: Icons.sentiment_dissatisfied,
            onTap: () {
              setState(() {
                selectedIndex = 3;
              });
            }),
        GridTileWidget(
            selected: selectedIndex == 4,
            title: 'Escalation',
            icon: Icons.sentiment_very_dissatisfied,
            onTap: () {
              setState(() {
                selectedIndex = 4;
              });
            })
      ],
    );
  }
}
