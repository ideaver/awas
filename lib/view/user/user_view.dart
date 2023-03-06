import 'package:awas_core/res/utils/enums.dart';
import 'package:awas_core/view/user/user_page.dart';

import 'package:flutter/material.dart';

import '../../res/theme/colors/light_colors.dart';
import '../../res/utils/globals.dart';
import 'chat_room_view.dart';
import 'thank_you_view.dart';

class UserView extends StatelessWidget {
  final PageStateEnum userPageState;
  final bool isFabVisible;

  static const String editUserRouteName = '/user-edit';
  static const String viewAsMeRouteName = '/user-view-as-me';
  static const String viewAsOtherRouteName = '/user-view-as-other';

  const UserView({
    Key? key,
    required this.userPageState,
    this.isFabVisible = false,
  }) : super(key: key);

  const UserView.edit({
    super.key,
    this.userPageState = PageStateEnum.edit,
    this.isFabVisible = true,
  });

  const UserView.viewAsMe({
    super.key,
    this.userPageState = PageStateEnum.viewAsMe,
    this.isFabVisible = false,
  });

  const UserView.viewAsOther({
    super.key,
    this.userPageState = PageStateEnum.viewAsOther,
    this.isFabVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return UserPage(
      userPageState: userPageState,
      userRole: currentUserRole,
      onTapSaveButton: () {
        // TODO
        Navigator.pushNamed(
          context,
          ThankYouView.profileUpdaterouteName,
        );
      },
      isFabVisible: isFabVisible,
      actions: userPageState == PageStateEnum.edit
          ? []
          : userPageState == PageStateEnum.viewAsMe
              ? [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, UserView.editUserRouteName);
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: LightColors.kDarkGreyColor,
                    ),
                  ),
                  const SizedBox(width: defaultMargin / 4)
                ]
              : [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ChatRoomView.routeName);
                    },
                    icon: const Icon(
                      Icons.chat,
                      color: LightColors.kPrimaryColor,
                    ),
                  ),
                  const SizedBox(width: defaultMargin / 4)
                ],
    );
  }
}
