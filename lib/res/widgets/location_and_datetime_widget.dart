import 'package:awas/view/report/report_location.dart';
import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';
import '../utils/enums.dart';

class LocationAndDateTimeTileWidget extends StatelessWidget {
  final PageState userPageState;
  const LocationAndDateTimeTileWidget({
    Key? key,
    required this.userPageState,
  }) : super(key: key);

  const LocationAndDateTimeTileWidget.edit()
      : this(userPageState: PageState.edit);

  @override
  Widget build(BuildContext context) {
    const EdgeInsets contentPadding = EdgeInsets.all(defaultMargin / 2);
    final RoundedRectangleBorder shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultCircular));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style:
              LightColors.black2TextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: defaultMargin / 2),
        ListTile(
          onTap: () {
            //TODO: if viewer : implement https://pub.dev/packages/map_launcher
            Navigator.pushNamed(
                context,
                userPageState == PageState.edit
                    ? ReportLocationPage.pickerRouteName
                    : ReportLocationPage.viewRouteName);
          },
          contentPadding: contentPadding,
          tileColor: LightColors.kPrimaryColor.withOpacity(0.1),
          shape: shape,
          leading: const Icon(
            Icons.navigation,
            color: LightColors.kPrimaryColor,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'North Mining Site',
                style: LightColors.blackTextStyle
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const SizedBox(height: defaultMargin / 4),
              Text(
                'Lat Long (48.276791, 13.161050)',
                style: LightColors.subTitle2TextStyle,
              )
            ],
          ),
          trailing: const Icon(Icons.chevron_right),
        ),
        const SizedBox(height: defaultMargin),
        Text(
          'Date Time',
          style:
              LightColors.black2TextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: defaultMargin / 2),
        ListTile(
          contentPadding: contentPadding,
          tileColor: LightColors.kPrimaryColor.withOpacity(0.1),
          shape: shape,
          leading: const Icon(
            Icons.calendar_today,
            color: LightColors.kPrimaryColor,
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Date & Time',
                style: LightColors.subTitle2TextStyle
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              const SizedBox(height: defaultMargin / 4),
              Text(
                '03:30 PM | 03/30/2022',
                style: LightColors.subTitle2TextStyle,
              )
            ],
          ),
        ),
      ],
    );
  }
}
