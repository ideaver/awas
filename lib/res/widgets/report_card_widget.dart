import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';
import 'kcard_widget.dart';

class ReportCardWidget extends StatelessWidget {
  const ReportCardWidget({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return KcardWidget(
        padding: const EdgeInsets.symmetric(
            vertical: defaultMargin / 2, horizontal: defaultMargin),
        onTap: () {
          Navigator.pushNamed(context, '/report-details');
        },
        elevation: 0.0,
        color: LightColors.kBackgroundColor,
        child: SizedBox(
          height: 110,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
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
              Expanded(
                child: Row(
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
              ),
              const SizedBox(
                height: defaultMargin,
              ),
              Expanded(
                child: Row(
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
              ),
            ],
          ),
        ));
  }
}
