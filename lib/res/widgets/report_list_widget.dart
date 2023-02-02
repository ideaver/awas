import 'package:awas/res/widgets/status_chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/colors/light_colors.dart';
import '../utils/globals.dart';
import 'kcard_widget.dart';
import 'report_card_widget.dart';

class ReportListWidget extends StatelessWidget {
  final BuildContext context;

  const ReportListWidget({
    Key? key,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(darkStatusBar);
    return Scaffold(
      backgroundColor: LightColors.kGreyColor,
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(defaultMargin),
        itemCount: 20,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Text(
              '235 Records found',
              style: LightColors.subTitle2TextStyle,
            );
          }
          return listTileWidget();
        },
      ),
    );
  }

  Padding listTileWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: defaultMargin),
      child: Row(
        children: [
          leadingWidget(),
          const SizedBox(
            width: defaultMargin / 2,
          ),
          Expanded(child: ReportCardWidget(context: context))
        ],
      ),
    );
  }

  Expanded cardWidget() {
    return Expanded(
      child: KcardWidget(
          padding: const EdgeInsets.symmetric(
              vertical: defaultMargin / 2, horizontal: defaultMargin),
          onTap: () {
            Navigator.pushNamed(context, '/report-details');
          },
          elevation: 0.0,
          color: LightColors.kBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Safe Observation',
                    style: LightColors.black2TextStyle,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.sync,
                    color: LightColors.kSecondaryColor,
                  )
                ],
              ),
              const SizedBox(
                height: defaultMargin / 2,
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                'Laborum aliqua do nostrud ss ewsgvsg',
                style: LightColors.subTitle3TextStyle,
              ),
              const SizedBox(
                height: defaultMargin / 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.near_me,
                    color: LightColors.kPrimaryColor,
                    size: 20,
                  ),
                  const SizedBox(
                    width: defaultMargin / 2,
                  ),
                  Text(
                    overflow: TextOverflow.ellipsis,
                    'North Mining Site',
                    style: LightColors.subTitle2TextStyle,
                  )
                ],
              ),
              const SizedBox(
                height: defaultMargin,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.forum,
                    color: LightColors.kDarkGreyColor,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '0',
                    style: LightColors.subTitle2TextStyle,
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.share,
                    color: LightColors.kDarkGreyColor,
                    size: 16,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '0',
                    style: LightColors.subTitle2TextStyle,
                  )
                ],
              ),
            ],
          )),
    );
  }

  Column leadingWidget() {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(defaultMargin / 3),
            decoration: const BoxDecoration(
                color: LightColors.kTertiaryColor, shape: BoxShape.circle),
            child: const Icon(
              Icons.insert_emoticon,
              color: LightColors.kWhiteColor,
            )),
        const statusChipWidget(),
        Text(
          'April 27',
          style: LightColors.subTitle3TextStyle,
        )
      ],
    );
  }
}
