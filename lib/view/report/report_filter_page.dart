import '../../res/widgets/report_category_grid_widget.dart';
import '/res/widgets/kelevated_button.dart';
import '/res/widgets/kexpansionTile_widget.dart';
import '/res/widgets/krange_slider_widget.dart';

import '../../res/widgets/company_custom_field_widget.dart';
import '../../res/widgets/kanimated_list_widget.dart';
import '/res/theme/colors/light_colors.dart';
import '/res/widgets/kappbar_widget.dart';
import 'package:flutter/material.dart';

class ReportFilterPage extends StatelessWidget {
  const ReportFilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      appBar: KappBarWidget(
        title: 'Filters',
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.close,
                color: LightColors.kDarkGreyColor,
                size: 20,
              ))
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          KexpansionTileWidget(title: 'Conditions', children: [
            checkboxListTileWidget(title: 'Trending'),
            checkboxListTileWidget(title: 'Open'),
            checkboxListTileWidget(title: 'Close'),
            checkboxListTileWidget(title: 'Frequent'),
            checkboxListTileWidget(title: 'Most liked'),
            checkboxListTileWidget(title: 'Most shared'),
          ]),
          const KexpansionTileWidget(
              initiallyExpanded: false,
              title: 'Report Category',
              children: [
                ReportCategoryGridWidget(),
                SizedBox(
                  height: defaultMargin,
                )
              ]),
          const KexpansionTileWidget(
            initiallyExpanded: false,
            title: 'Points',
            children: [KrangeSliderWidget()],
          ),
          const KanimatedListExpansionWidget()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: KelevatedButtonWidget.floating(
        title: 'Confirm (6)',
        onPressed: () {},
      ),
    );
  }

  Widget checkboxListTileWidget({required String title}) {
    return CheckboxListTile(
      value: false,
      dense: true,
      checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      onChanged: (value) {},
      title: Text(
        title,
        style: LightColors.subTitle2TextStyle,
      ),
    );
  }
}
