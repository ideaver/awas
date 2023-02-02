import '/res/widgets/kbottom_navigation_bar.dart';
import '/res/widgets/kdivider_widget.dart';

import '../res/utils/enums.dart';
import '../res/widgets/kelevated_button.dart';
import '/res/widgets/kcard_widget.dart';
import 'package:flutter/material.dart';

import '../res/theme/colors/light_colors.dart';

class ThankYouPageModel {
  final String title;
  final String instruction;
  final PointsTransactionWidgetModel? pointsTransactionWidget;
  final Widget? floatingActionButton;

  ThankYouPageModel(
      {required this.title,
      required this.instruction,
      this.pointsTransactionWidget,
      this.floatingActionButton});
}

class PointsTransactionWidgetModel {
  final Map<String, int> item;

  PointsTransactionWidgetModel({required this.item});
}

class ThankYouPage extends StatelessWidget {
  final ConfirmationEvent event;
  ThankYouPageModel? thankYouPageModel;

  static const String profileUpdaterouteName = '/profile-update-thank-you';

  // ignore: prefer_const_constructors_in_immutables
  ThankYouPage(
      {super.key, required this.event, required this.thankYouPageModel});

  ThankYouPage.profileUpdated({ThankYouPageModel? thankYouPageModel})
      : this(
            event: ConfirmationEvent.profileUpdatedSuccess,
            thankYouPageModel: thankYouPageModel);

  @override
  Widget build(BuildContext context) {
    switch (event) {
      case ConfirmationEvent.profileUpdatedSuccess:
        thankYouPageModel = ThankYouPageModel(
            title: 'Thank You Budi, Profile Updated',
            instruction: 'Redirecting to your Dashboard...',
            floatingActionButton: KelevatedButtonWidget(
              title: 'Go to Dashboard',
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, KbottomNavigationBar.routeName);
              },
              icon: Icons.home,
            ));
        break;
      default:
    }

    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(defaultMargin),
        children: [
          const SizedBox(
            height: defaultMargin * 3,
          ),
          const Chip(
              labelPadding: EdgeInsets.all(defaultMargin / 2),
              backgroundColor: LightColors.kSuccessColor,
              label: Icon(
                Icons.done,
                color: LightColors.kWhiteColor,
                size: 50,
              )),
          const SizedBox(
            height: defaultMargin,
          ),
          Text(
            thankYouPageModel?.title ?? 'null',
            style: LightColors.linkTextStyle
                .copyWith(fontSize: 20.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: defaultMargin * 2,
          ),
          Text(
            thankYouPageModel?.instruction ?? 'null',
            style: LightColors.subTitleTextStyle
                .copyWith(fontSize: 14.0, fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: defaultMargin * 2,
          ),
          pointsTransactionWidget(),
          const SizedBox(
            height: defaultMargin * 2,
          ),
          thankYouPageModel?.floatingActionButton ?? const SizedBox()
        ],
      ),
    );
  }

  KcardWidget pointsTransactionWidget() {
    return KcardWidget(
      elevation: 0.0,
      color: LightColors.kGreyColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Point $index',
                        style: LightColors.subTitle2TextStyle,
                      ),
                      Text(
                        '+20',
                        style: LightColors.subTitle3TextStyle,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: defaultMargin / 2,
                  ),
                ],
              );
            },
          ),
          const SizedBox(
            height: defaultMargin,
          ),
          const KdividerWidget(),
          const SizedBox(
            height: defaultMargin,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Safety Awareness Points',
                style: LightColors.subTitle2TextStyle,
              ),
              Text(
                '20',
                style: LightColors.subTitleTextStyle,
              )
            ],
          ),
          const SizedBox(
            height: defaultMargin,
          ),
        ],
      ),
    );
  }
}
