import 'dart:async';

import 'package:awas/res/widgets/kelevated_button.dart';
import 'package:awas/view/thank_you_page.dart';

import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

class ReportLoadingPage extends StatelessWidget {
  static const String routeName = '/report-offline-loading';

  const ReportLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 2),
        () =>
            Navigator.pushNamed(context, ThankYouPage.profileUpdaterouteName));
    return Scaffold(
      backgroundColor: LightColors.kWhiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 60, minHeight: 60),
                child: Container(
                  decoration: const BoxDecoration(
                      color: LightColors.kGreyColor, shape: BoxShape.circle),
                  child: const CircularProgressIndicator(
                    strokeWidth: 7,
                    color: LightColors.kPrimaryColor,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                left: 0,
                top: 0,
                bottom: 0,
                child: Image.asset(
                  'assets/logo.png',
                  scale: 5,
                ),
              )
            ]),
            const SizedBox(
              height: defaultMargin,
            ),
            Text(
              'Offline Report Submitting',
              style: LightColors.linkTextStyle
                  .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Row(
        children: [
          Expanded(
            child: KelevatedButtonWidget.floating(
              title: 'Cancel',
              onPressed: () {
                Navigator.pushNamed(context, '/report-list');
              },
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
