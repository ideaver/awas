import 'package:awas/res/widgets/kexpansionTile_widget.dart';
import 'package:awas/res/widgets/krange_slider_widget.dart';

import '../../res/widgets/company_custom_field_widget.dart';
import '/res/theme/colors/light_colors.dart';
import '/res/widgets/kappbar_widget.dart';
import 'package:flutter/material.dart';

class UserFilterPage extends StatelessWidget {
  const UserFilterPage({super.key});

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
            checkboxListTileWidget(title: 'No Report this week'),
            checkboxListTileWidget(title: 'No Report last week'),
            checkboxListTileWidget(title: 'Top perfomer'),
            checkboxListTileWidget(title: 'low performer'),
            checkboxListTileWidget(title: 'Deactivated'),
          ]),
          const KexpansionTileWidget(
              initiallyExpanded: false,
              title: 'Position',
              children: [
                CompanyCustomFieldWidget(),
                SizedBox(
                  height: defaultMargin,
                )
              ]),
          const KexpansionTileWidget(
            initiallyExpanded: false,
            title: 'Points',
            children: [KrangeSliderWidget()],
          )
        ],
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
