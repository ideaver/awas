import '/res/theme/colors/light_colors.dart';
import '/res/widgets/star_badge_widget.dart';
import 'package:flutter/material.dart';

import '../../res/widgets/chart_widget.dart';
import '../../res/widgets/kcard_widget.dart';

class DashboardEmployeePage extends StatelessWidget {
  static const String routeName = '/dashboard-employee';

  const DashboardEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      appBar: appBarWidget(),
      body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(defaultMargin),
          children: [
            syncNotificationWidget(),
            const SizedBox(
              height: defaultMargin,
            ),
            const KcardWidget(
              padding: EdgeInsets.all(0.0),
              color: LightColors.kGreyColor,
              height: 300,
              elevation: 10,
              child: ChartWidget(),
            )
          ]),
    );
  }

  KcardWidget syncNotificationWidget() {
    return KcardWidget(
        color: LightColors.kDangerColor,
        elevation: 0.0,
        child: Row(
          children: [
            const Icon(
              Icons.signal_wifi_off,
              color: LightColors.kWhiteColor,
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    'You have 2 Unsynced Report',
                    style: LightColors.whiteTextStyle
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 14.0),
                  ),
                  Text(
                    'Please connect to the internet ASAP',
                    style: LightColors.subTitle2TextStyle.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: LightColors.kWhiteColor),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: LightColors.kWhiteColor),
          ],
        ));
  }

  AppBar appBarWidget() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: LightColors.kBackgroundColor,
      toolbarHeight: 80,
      leadingWidth: 200,
      leading: Center(
        child: Text(
          'Hi Budi',
          style: LightColors.titleTextStyle.copyWith(fontSize: 24.0),
        ),
      ),
      centerTitle: true,
      title: Image.asset('assets/logo.png', scale: 5),
      actions: [
        SizedBox(
          width: 120,
          child: Stack(alignment: AlignmentDirectional.centerStart, children: [
            StarBadgeWidget.rightMargin(),
            const Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              child: CircleAvatar(
                radius: 23,
                backgroundImage: AssetImage('assets/avatar1.png'),
                backgroundColor: LightColors.kSecondaryColor,
              ),
            )
          ]),
        ),
        const SizedBox(
          width: defaultMargin / 4,
        )
      ],
    );
  }
}
