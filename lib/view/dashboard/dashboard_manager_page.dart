import 'package:awas/view/report/report_list_page.dart';
import 'package:awas/view/user/user_page.dart';

import '../../res/utils/enums.dart';
import '../../res/utils/globals.dart';
import '/res/widgets/pie_chart_widget.dart';
import '/res/widgets/report_card_widget.dart';
import 'package:flutter/services.dart';

import '../../res/widgets/custom_circular_progress_widget.dart';

import '../../res/widgets/user_list_widget.dart';
import '/res/theme/colors/light_colors.dart';

import 'package:flutter/material.dart';

import '../../res/widgets/line_chart_widget.dart';
import '../../res/widgets/kcard_widget.dart';

class DashboardManagerPage extends StatelessWidget {
  static const String routeName = '/dashboard-manager';

  const DashboardManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kDarkBlue,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            systemOverlayStyle: lightStatusBar,
            elevation: 0.0,
            toolbarHeight: 52,
            stretch: true,
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, UserPage.editModerouteName);
              },
              child: const Padding(
                padding: EdgeInsets.only(
                    left: defaultMargin, right: defaultMargin / 3),
                child: CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage('assets/avatar1.png'),
                  backgroundColor: LightColors.kSecondaryColor,
                ),
              ),
            ),
            title: Text(
              'Hi Budi',
              style: LightColors.titleTextStyle.copyWith(
                  fontSize: 24.0, color: LightColors.kBackgroundColor),
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(150),
                child: riskLevelIndicatorWidget(context)),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.only(top: defaultMargin),
              decoration: const BoxDecoration(
                  color: LightColors.kBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(defaultCircular * 2),
                      topRight: Radius.circular(defaultCircular * 2))),
              child: Padding(
                padding: const EdgeInsets.all(defaultMargin),
                child: Column(
                  children: [
                    syncNotificationWidget(context),
                    const SizedBox(
                      height: defaultMargin,
                    ),
                    Row(
                      children: [
                        Text('Report Overview',
                            style: LightColors.titleTextStyle
                                .copyWith(fontSize: 16.0)),
                        const Spacer(),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: ActionChip(
                            onPressed: () {},
                            backgroundColor: LightColors.kInfoColor,
                            label: Text(
                              '2022',
                              style: LightColors.whiteTextStyle.copyWith(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            avatar: const Icon(
                              Icons.arrow_drop_down,
                              color: LightColors.kBackgroundColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: defaultMargin,
                    ),
                    labelInfoWidget(),
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
                        Expanded(child: CustomCircularProgressWidget()),
                        //TODO: decide what chart first row
                        Expanded(child: CustomCircularProgressWidget())
                      ],
                    ),
                    const SizedBox(
                      height: defaultMargin,
                    ),
                    const PieChartWidget(),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: sublistWidget(),
          )
        ],
      ),
    );
  }

  Padding riskLevelIndicatorWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
      child: KcardWidget(
          elevation: 5,
          width: double.infinity,
          color: LightColors.kBackgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              riskLevelIndicatorItemWidget(context, riskLevel: RiskLevel.low),
              riskLevelIndicatorItemWidget(context,
                  riskLevel: RiskLevel.medium),
              riskLevelIndicatorItemWidget(context, riskLevel: RiskLevel.high),
              riskLevelIndicatorItemWidget(context,
                  riskLevel: RiskLevel.escalation),
            ],
          )),
    );
  }

  Widget riskLevelIndicatorItemWidget(BuildContext context,
      {required RiskLevel riskLevel}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ReportListPage.routeName);
      },
      child: Column(
        children: [
          Icon(
            riskLevel.iconData,
            color: riskLevel.color,
          ),
          const SizedBox(
            height: defaultMargin / 4,
          ),
          Text('30', style: LightColors.black2TextStyle),
          const SizedBox(
            height: defaultMargin / 4,
          ),
          Text(
            riskLevel.name.toUpperCase(),
            style: LightColors.subTitle3TextStyle,
          ),
        ],
      ),
    );
  }

  Row labelInfoWidget() {
    return Row(
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
    );
  }

  SliverAppBar sliverAppBarWidget(BuildContext context) {
    return SliverAppBar(
        automaticallyImplyLeading: false,
        expandedHeight: MediaQuery.of(context).size.height / 4,
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.only(
                bottom: defaultMargin,
                left: defaultMargin,
                right: defaultMargin),
            child: KcardWidget(
                onTap: () {},
                elevation: 0.0,
                color: LightColors.kBackgroundColor.withOpacity(0.1),
                borderColor: LightColors.kBackgroundColor,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your total Report',
                            style: LightColors.subTitle2TextStyle.copyWith(
                                color: LightColors.kBackgroundColor,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: defaultMargin / 2,
                          ),
                          RichText(
                            text: TextSpan(
                              style: LightColors.linkTextStyle.copyWith(
                                  letterSpacing: 2,
                                  color: LightColors.kBackgroundColor),
                              children: const [
                                TextSpan(
                                    text: '23/',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 32)),
                                TextSpan(
                                    text: '35', style: TextStyle(fontSize: 20)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: defaultMargin / 2,
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.arrow_drop_up,
                                  color: LightColors.kWhiteColor,
                                ),
                                Text(
                                  '+3',
                                  style: LightColors.black2TextStyle.copyWith(
                                    color: LightColors.kBackgroundColor,
                                  ),
                                ),
                                const SizedBox(
                                  width: defaultMargin,
                                ),
                                Expanded(
                                  child: Text(
                                    'period of month',
                                    style: LightColors.subTitle2TextStyle
                                        .copyWith(
                                            color:
                                                LightColors.kBackgroundColor),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: KcardWidget(
                        color: LightColors.kLavender,
                        elevation: 5.0,
                        padding: EdgeInsets.all(defaultMargin / 2),
                        child: Icon(
                          Icons.photo_camera,
                          color: LightColors.kPrimaryColor,
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }

  Container sublistWidget() {
    return Container(
        decoration: const BoxDecoration(
          color: LightColors.kGreyColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: defaultMargin,
            ),
            Padding(
              padding: const EdgeInsets.all(defaultMargin),
              child: Text('Trending Report',
                  style: LightColors.titleTextStyle.copyWith(fontSize: 16.0)),
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
                  style: LightColors.titleTextStyle.copyWith(fontSize: 16.0)),
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
        ));
  }

  Widget syncNotificationWidget(BuildContext context) {
    return KcardWidget(
        onTap: () {
          Navigator.pushNamed(context, ReportListPage.routeName);
        },
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
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: LightColors.kDarkBlue),
      elevation: 0.0,
      backgroundColor: LightColors.kDarkBlue,
      toolbarHeight: 80,
      leadingWidth: defaultMargin,
      leading: Row(
        children: const [
          Padding(
            padding:
                EdgeInsets.only(left: defaultMargin, right: defaultMargin / 3),
            child: CircleAvatar(
              radius: 23,
              backgroundImage: AssetImage('assets/avatar1.png'),
              backgroundColor: LightColors.kSecondaryColor,
            ),
          ),
        ],
      ),
      centerTitle: false,
      title: Text(
        'Hi Budi',
        style: LightColors.titleTextStyle
            .copyWith(fontSize: 24.0, color: LightColors.kBackgroundColor),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
        const SizedBox(
          width: defaultMargin / 4,
        )
      ],
    );
  }
}
