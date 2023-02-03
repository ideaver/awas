import '../../res/widgets/checkbox_listtile_widget.dart';
import '../../res/widgets/kdropdown_widget.dart';
import '/res/widgets/risk_level_grid_widget.dart';
import '../../res/widgets/report_category_grid_widget.dart';
import '/res/widgets/kelevated_button.dart';
import '/res/widgets/kexpansionTile_widget.dart';
import '../../res/widgets/kanimated_list_widget.dart';
import '/res/theme/colors/light_colors.dart';
import '/res/widgets/kappbar_widget.dart';
import 'package:flutter/material.dart';

class ReportFilterPage extends StatelessWidget {
  static const String routeName = '/report-filter';

  const ReportFilterPage({super.key});

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
              ))
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const [
          KexpansionTileWidget(title: 'Conditions', children: [
            CheckboxListTileWidget(title: 'Trending'),
            CheckboxListTileWidget(title: 'Open'),
            CheckboxListTileWidget(title: 'Close'),
            CheckboxListTileWidget(title: 'Frequent'),
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
                KdropdownWidget(title: 'Event'),
                SizedBox(
                  height: defaultMargin,
                ),
                KdropdownWidget(title: 'Detail'),
                SizedBox(
                  height: defaultMargin,
                ),
              ]),
          KanimatedListExpansionWidget()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: KelevatedButtonWidget.floating(
        title: 'Confirm (6)',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
