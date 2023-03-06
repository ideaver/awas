import 'package:awas_core/res/utils/enums.dart';
import 'package:awas_core/view/user/thank_you_page.dart';
import 'package:flutter/material.dart';

import '../main/main_view.dart';

class ThankYouView extends StatelessWidget {
  final ConfirmationEventEnum event;

  static const String profileUpdaterouteName = '/profile-update-thank-you';

  const ThankYouView({
    super.key,
    required this.event,
  });

  const ThankYouView.profileUpdated({
    super.key,
    this.event = ConfirmationEventEnum.profileUpdatedSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return ThankYouPage(
      onTapDashboardButton: () {
        Navigator.pushNamed(context, MainView.routeName);
      },
      event: ConfirmationEventEnum.profileUpdatedSuccess,
    );
  }
}
