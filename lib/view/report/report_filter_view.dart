import 'package:awas_core/res/widgets/checkbox_listtile_widget.dart';
import 'package:awas_core/res/widgets/kanimated_list_widget.dart';
import 'package:awas_core/res/widgets/kappbar_widget.dart';
import 'package:awas_core/res/widgets/kdropdown_widget.dart';
import 'package:awas_core/res/widgets/kelevated_button.dart';
import 'package:awas_core/res/widgets/kexpansiontile_widget.dart';
import 'package:awas_core/res/widgets/report_category_grid_widget.dart';
import 'package:awas_core/res/widgets/risk_level_grid_widget.dart';

import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

class ReportFilterView extends StatelessWidget {
  static const String routeName = '/report-filter';

  const ReportFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: add clear button
    //TODO: Filter by words recommendation
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      appBar: KappBarWidget(
        context: context,
        title: 'Filters',
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.clear_all,
              color: LightColors.kDarkGreyColor,
              size: 20,
            ),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          KexpansionTileWidget(title: 'Conditions', children: [
            CheckboxListTileWidget(title: 'Trending'),
            CheckboxListTileWidget(title: 'Open'),
            CheckboxListTileWidget(title: 'Close'),
            CheckboxListTileWidget(title: 'TOP Five Risk'),
            CheckboxListTileWidget(title: 'Most shared'),
          ]),
          KexpansionTileWidget(
              initiallyExpanded: false,
              title: 'Report Category',
              children: [
                ReportCategoryGridWidget(),
                SizedBox(
                  height: defaultMargin,
                )
              ]),
          KexpansionTileWidget(
              initiallyExpanded: false,
              title: 'Risk Level',
              children: [
                RiskLevelGridWidget(),
                SizedBox(
                  height: defaultMargin,
                )
              ]),
          KexpansionTileWidget(
              initiallyExpanded: false,
              title: 'Observation',
              children: [
                KdropdownWidget(
                  title: 'Event',
                  items: ['items!'],
                ),
                SizedBox(
                  height: defaultMargin,
                ),
                KdropdownWidget(
                  title: 'Detail',
                  items: ['items!'],
                ),
                SizedBox(
                  height: defaultMargin,
                ),
              ]),
          KanimatedListExpansionWidget()
        ],
      ),
      bottomSheet: KelevatedButtonWidget.floating(
        title: 'Confirm (6)',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
