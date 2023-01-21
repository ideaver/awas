import 'package:awas/res/widgets/pie_chart_widget.dart';
import 'package:awas/res/widgets/report_card_widget.dart';

import '../../res/widgets/custom_circular_progress_widget.dart';
import '../../res/widgets/user_list_widget.dart';
import '/res/theme/colors/light_colors.dart';
import '/res/widgets/star_badge_widget.dart';
import 'package:flutter/material.dart';

import '../../res/widgets/line_chart_widget.dart';
import '../../res/widgets/kcard_widget.dart';

class DashboardEmployeePage extends StatelessWidget {
  static const String routeName = '/dashboard-employee';

  const DashboardEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      appBar: appBarWidget(),
      extendBody: true,
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        // syncNotificationWidget(),
        Padding(
          padding: const EdgeInsets.all(defaultMargin),
          child: Column(
            children: [
              Row(
                children: [
                  Text('Top Employee of the Month',
                      style:
                          LightColors.titleTextStyle.copyWith(fontSize: 16.0)),
                  const Spacer(),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextButton.icon(
                      style: const ButtonStyle(),
                      //TODO apply rounded splash
                      onPressed: () {},
                      label: Text(
                        '2022',
                        style: LightColors.linkTextStyle,
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: LightColors.kBlackColor,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: defaultMargin / 3,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: LightColors.kDangerColor,
                    size: 17,
                  ),
                  const SizedBox(
                    width: defaultMargin / 4,
                  ),
                  Text(
                    'Near Miss',
                    style: LightColors.subTitle3TextStyle,
                  ),
                  const SizedBox(
                    width: defaultMargin / 3,
                  ),
                  const Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: LightColors.kSuccessColor,
                    size: 17,
                  ),
                  const SizedBox(
                    width: defaultMargin / 4,
                  ),
                  Text(
                    'Safe',
                    style: LightColors.subTitle3TextStyle,
                  ),
                  const SizedBox(
                    width: defaultMargin / 3,
                  ),
                  const Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: LightColors.kPrimaryColor,
                    size: 17,
                  ),
                  const SizedBox(
                    width: defaultMargin / 4,
                  ),
                  Text(
                    'Unsafe',
                    style: LightColors.subTitle3TextStyle,
                  ),
                  const SizedBox(
                    width: defaultMargin / 3,
                  ),
                  const Icon(
                    Icons.sentiment_very_dissatisfied,
                    color: LightColors.kBlackColor,
                    size: 17,
                  ),
                  const SizedBox(
                    width: defaultMargin / 4,
                  ),
                  Text(
                    'Escalation',
                    style: LightColors.subTitle3TextStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: defaultMargin,
              ),
              const KcardWidget(
                width: double.infinity,
                padding: EdgeInsets.all(0.0),
                color: LightColors.kGreyColor,
                height: 250,
                elevation: 5,
                child: ChartWidget(),
              ),
              const SizedBox(
                height: defaultMargin,
              ),
              Row(
                children: const [
                  Expanded(child: PieChartWidget()),
                  Expanded(child: CustomCircularProgressWidget()),
                ],
              ),
              const SizedBox(
                height: defaultMargin,
              ),
              KcardWidget(
                  elevation: 0.0,
                  color: LightColors.kBackgroundColor,
                  borderColor: LightColors.kLavender,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your total Report',
                            style: LightColors.subTitle2TextStyle,
                          ),
                          const SizedBox(
                            height: defaultMargin / 2,
                          ),
                          RichText(
                            text: TextSpan(
                              style: LightColors.linkTextStyle,
                              children: const [
                                TextSpan(
                                    text: '23/',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32)),
                                TextSpan(
                                    text: '35',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: defaultMargin / 2,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.arrow_drop_up,
                                color: LightColors.kSuccessColor,
                              ),
                              Text(
                                '+3',
                                style: LightColors.black2TextStyle.copyWith(
                                  color: LightColors.kSuccessColor,
                                ),
                              ),
                              const SizedBox(
                                width: defaultMargin,
                              ),
                              Text(
                                'period of month',
                                style: LightColors.subTitle2TextStyle,
                              )
                            ],
                          )
                        ],
                      ),
                      const KcardWidget(
                        elevation: 5.0,
                        padding: EdgeInsets.all(defaultMargin / 2),
                        child: Icon(
                          Icons.receipt,
                          color: LightColors.kBackgroundColor,
                        ),
                      )
                    ],
                  )),
              const SizedBox(
                height: defaultMargin,
              ),
            ],
          ),
        ),

        Container(
            color: LightColors.kGreyColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(defaultMargin),
                  child: Text('Trending Report',
                      style:
                          LightColors.titleTextStyle.copyWith(fontSize: 16.0)),
                ),
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              bottom: defaultMargin, left: defaultMargin),
                          child: AspectRatio(
                              aspectRatio: 1.8,
                              child: ReportCardWidget(context: context)),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(defaultMargin),
                  child: Text('Top Employee of the Month',
                      style:
                          LightColors.titleTextStyle.copyWith(fontSize: 16.0)),
                ),
                ...List.generate(10, (index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: UserListWidget(),
                  );
                }),
                const SizedBox(
                  height: defaultMargin * 8,
                )
              ],
            )),
      ]),
    );
  }

  Widget syncNotificationWidget() {
    return KcardWidget(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultMargin, vertical: defaultMargin / 2),
        color: LightColors.kDangerColor,
        elevation: 0.0,
        child: Row(
          children: [
            const Icon(
              Icons.signal_wifi_off,
              color: LightColors.kBackgroundColor,
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
                    style: LightColors.whiteTextStyle.copyWith(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
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
