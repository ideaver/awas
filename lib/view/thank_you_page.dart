import '/res/widgets/kfloating_action_button.dart';
import '/res/widgets/ktext_form_field.dart';
import 'package:flutter/material.dart';

import '../res/theme/colors/light_colors.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
              'Reset Password Instructions sent to your email',
              style: LightColors.linkTextStyle
                  .copyWith(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: defaultMargin * 2,
            ),
            Text(
              'Check your inbox',
              style: LightColors.subTitleTextStyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: KfloatingActionButton(
          icon: const Icon(Icons.email), onPressed: () {}, title: 'Open Gmail'),
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
