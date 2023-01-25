import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';
import 'kcard_widget.dart';
import 'star_badge_widget.dart';
import 'user_custom_field_datatable_widget.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return KcardWidget(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/avatar1.png'),
              radius: 35,
              backgroundColor: LightColors.kWhiteColor,
            ),
            const SizedBox(
              height: defaultMargin,
            ),
            StarBadgeWidget()
          ],
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'Antoni Sudarsono',
                style: LightColors.whiteTextStyle
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
              const SizedBox(
                height: defaultMargin,
              ),
              const UserCustomFieldDatatableWidget(),
            ],
          ),
        )
      ],
    ));
  }
}
