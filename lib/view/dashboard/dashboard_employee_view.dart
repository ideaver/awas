import 'package:awas/view/report/camera_view.dart';
import 'package:awas/view/report/report_list_view.dart';
import 'package:awas_core/res/theme/app_assets.dart';
import 'package:awas_core/res/widgets/app_image.dart';
import 'package:awas_core/res/widgets/custom_circular_progress_widget.dart';
import 'package:awas_core/res/widgets/kcard_widget.dart';
import 'package:awas_core/res/widgets/kdropdown_widget.dart';
import 'package:awas_core/res/widgets/line_chart_widget.dart';
import 'package:awas_core/res/widgets/pie_chart_widget.dart';
import 'package:awas_core/res/widgets/report_card_widget.dart';
import 'package:awas_core/res/widgets/star_badge_widget.dart';
import 'package:awas_core/res/widgets/user_list_widget.dart';

import '../user/user_view.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import '/res/theme/colors/light_colors.dart';

class DashboardEmployeeView extends StatelessWidget {
  static const String routeName = '/dashboard-employee';

  const DashboardEmployeeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kPrimaryColor,
      appBar: appBarWidget(context),
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [sliverAppBarWidget(context)];
        },
        body: bodyWidget(context),
      ),
    );
  }

  Container bodyWidget(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: LightColors.kBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(defaultCircular * 2),
          topRight: Radius.circular(defaultCircular * 2),
        ),
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: Column(
              children: [
                syncNotificationWidget(context),
                const SizedBox(
                  height: defaultMargin,
                ),
                Row(
                  children: [
                    Text(
                      'Report Overview',
                      style:
                          LightColors.titleTextStyle.copyWith(fontSize: 16.0),
                    ),
                    const Spacer(),
                    const SizedBox(
                      width: 90,
                      height: 32,
                      child: KdropdownWidget(
                        fillColor: LightColors.kInfoColor,
                        hintText: '2022',
                        items: ['2021', '2020', '2019', '2018'],
                      ),
                    ),
                    // Directionality(
                    //   textDirection: TextDirection.rtl,
                    //   child: ActionChip(
                    //     onPressed: () {},
                    //     backgroundColor: LightColors.kInfoColor,
                    //     label: Text(
                    //       '2022',
                    //       style: LightColors.whiteTextStyle.copyWith(
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 12,
                    //       ),
                    //     ),
                    //     avatar: const Icon(
                    //       Icons.arrow_drop_down,
                    //       color: LightColors.kBackgroundColor,
                    //     ),
                    //   ),
                    // ),
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
          sublistWidget(context),
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
            right: defaultMargin,
          ),
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
                                fontSize: 32,
                              ),
                            ),
                            TextSpan(
                              text: '35',
                              style: TextStyle(fontSize: 20),
                            ),
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
                                style: LightColors.subTitle2TextStyle.copyWith(
                                  color: LightColors.kBackgroundColor,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                KcardWidget(
                  onTap: () {
                    Navigator.pushNamed(context, CameraView.routeName);
                  },
                  color: LightColors.kLavender,
                  elevation: 5.0,
                  padding: const EdgeInsets.all(defaultMargin / 2),
                  child: const Icon(
                    Icons.photo_camera,
                    color: LightColors.kPrimaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container sublistWidget(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: LightColors.kGreyColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(defaultCircular * 2),
          topRight: Radius.circular(defaultCircular * 2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: defaultMargin,
          ),
          Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: Text(
              'Trending Report',
              style: LightColors.titleTextStyle.copyWith(fontSize: 16.0),
            ),
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
                    bottom: defaultMargin,
                    left: defaultMargin,
                  ),
                  child: AspectRatio(
                    aspectRatio: 1.8,
                    child: ReportCardWidget(context: context),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: Text(
              'Top Employee of the Month',
              style: LightColors.titleTextStyle.copyWith(fontSize: 16.0),
            ),
          ),
          ...List.generate(10, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              child: UserListWidget(
                onTapProfile: () {
                  Navigator.pushNamed(context, UserView.viewAsOtherRouteName);
                },
              ),
            );
          }),
          const SizedBox(
            height: defaultMargin * 8,
          )
        ],
      ),
    );
  }

  Widget syncNotificationWidget(BuildContext context) {
    return KcardWidget(
        onTap: () {
          Navigator.pushNamed(context, ReportListView.routeName);
        },
        padding: const EdgeInsets.symmetric(
          horizontal: defaultMargin,
          vertical: defaultMargin / 2,
        ),
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
            const Icon(
              Icons.chevron_right,
              color: LightColors.kWhiteColor,
            ),
          ],
        ));
  }

  AppBar appBarWidget(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: LightColors.kPrimaryColor,
      ),
      elevation: 0.0,
      backgroundColor: LightColors.kPrimaryColor,
      toolbarHeight: 80,
      leadingWidth: 150,
      leading: Center(
        child: Text(
          'Hi Budi',
          style: LightColors.titleTextStyle.copyWith(
            fontSize: 24.0,
            color: LightColors.kBackgroundColor,
          ),
        ),
      ),
      centerTitle: true,
      title: Image.asset('assets/logo.png', scale: 5, color: Colors.white),
      actions: [
        SizedBox(
          width: 120,
          child: Stack(
            alignment: AlignmentDirectional.centerStart,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: defaultMargin),
                child: StarBadgeWidget(),
              ),
              Positioned(
                right: 0,
                // top: 0,
                // bottom: 0,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: LightColors.kSecondaryColor,
                    shape: BoxShape.circle,
                    // image: DecorationImage(
                    //   image: AssetImage('assets/avatar1.png'),
                    // ),
                  ),
                  child: InkWell(
                    customBorder: const CircleBorder(),
                    onTap: () {
                      Navigator.pushNamed(context, UserView.viewAsMeRouteName);
                    },
                    child: const ClipOval(
                      child: AppImage(
                        image: 'assets/avatar1.png',
                        placeholder: AppAssets.user,
                        imgProvider: ImgProvider.assetImage,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(width: defaultMargin / 4)
      ],
    );
  }
}
