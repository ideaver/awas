import 'package:awas/res/theme/colors/light_colors.dart';
import 'package:awas/res/widgets/star_badge_widget.dart';
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
              height: defaultMargin * 2,
            ),
            Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultCircular),
              ),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: LightColors.kBackgroundColor,
                    borderRadius: kBorderRadius),
                child: const ChartWidget(
                  isShowingMainData: false,
                ),
              ),
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
        Center(
          child: SizedBox(
            width: 125,
            child: Stack(children: const [
              StarBadgeWidget(),
              Positioned(
                right: 0,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://cdn.visily.ai/app/production/1672195451865/static/media/F2.da2ec199.png'),
                  radius: 25,
                  backgroundColor: LightColors.kWhiteColor,
                ),
              )
            ]),
          ),
        ),
        const SizedBox(
          width: defaultMargin / 4,
        )
      ],
    );
  }
}
