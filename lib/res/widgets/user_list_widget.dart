import 'package:awas/view/user/user_page.dart';
import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';
import 'kcard_widget.dart';
import 'star_badge_widget.dart';
import 'user_custom_field_datatable_widget.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultMargin),
      child: Row(
        children: [
          Column(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/avatar1.png'),
                radius: 25,
                backgroundColor: LightColors.kSecondaryColor,
              ),
              const SizedBox(height: defaultMargin),
              StarBadgeWidget(),
            ],
          ),
          const SizedBox(
            width: defaultMargin / 2,
          ),
          Expanded(
            child: KcardWidget(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultMargin, horizontal: defaultMargin),
                onTap: () {
                  //TODO: if the id the same as login then view me
                  Navigator.pushNamed(context, UserPage.viewAsOtherRouteName);
                },
                elevation: 0.0,
                color: LightColors.kBackgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Antoni Sudarsono',
                      style: LightColors.black2TextStyle,
                    ),
                    const SizedBox(
                      height: defaultMargin / 2,
                    ),
                    const UserCustomFieldDatatableWidget(
                        textColor: LightColors.kBlackColor),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
