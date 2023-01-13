import 'package:awas/res/widgets/kcard_widget.dart';
import 'package:awas/res/widgets/kelevated_button.dart';

import '/res/widgets/ktext_form_field.dart';
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
  final ThankYouPageModel thankYouPageModel;

  const ThankYouPage({super.key, required this.thankYouPageModel});

  @override
  Widget build(BuildContext context) {
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
            thankYouPageModel.title,
            style: LightColors.linkTextStyle
                .copyWith(fontSize: 20.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: defaultMargin * 2,
          ),
          Text(
            thankYouPageModel.instruction,
            style: LightColors.subTitleTextStyle
                .copyWith(fontSize: 14.0, fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: defaultMargin * 4,
          ),
          PointsTransactionWidget()
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: thankYouPageModel.floatingActionButton,
    );
  }

  KcardWidget PointsTransactionWidget() {
    return KcardWidget(
      elevation: 0.0,
      color: LightColors.kGreyColor,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Point $index',
                style: LightColors.subTitle2TextStyle,
              ),
              const SizedBox(
                height: defaultMargin,
              )
            ],
          );
        },
      ),
    );
  }

  Row logoAndTextWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/logo.png',
          width: 100,
          height: 100,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Don\'t Worry!!',
                style: LightColors.titleTextStyle,
              ),
              Text(
                'just Input your email',
                overflow: TextOverflow.visible,
                style: LightColors.subTitleTextStyle,
              ),
              Text(
                'to Reset Password',
                overflow: TextOverflow.visible,
                style: LightColors.subTitleTextStyle.copyWith(fontSize: 14),
              ),
            ],
          ),
        )
      ],
    );
  }
}
