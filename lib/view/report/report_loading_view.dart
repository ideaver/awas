import 'dart:async';

import 'package:awas_core/res/utils/enums.dart';
import 'package:awas_core/res/widgets/kelevated_button.dart';

import '../../res/utils/globals.dart';
import '../main/main_view.dart';
import '../user/thank_you_view.dart';
import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

import 'report_list_view.dart';

class ReportLoadingView extends StatelessWidget {
  static const String routeName = '/report-offline-loading';

  const ReportLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
      () => Navigator.pushReplacementNamed(
        context,
        currentUserRole == RoleEnum.employee
            ? ThankYouView.profileUpdaterouteName
            : MainView.routeName,
      ),
    );
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
                    color: LightColors.kGreyColor,
                    shape: BoxShape.circle,
                  ),
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
            const SizedBox(height: defaultMargin),
            Text(
              'Offline Report Submitting',
              style: LightColors.linkTextStyle.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Expanded(
        child: KelevatedButtonWidget.floating(
          title: 'Cancel',
          onPressed: () {
            Navigator.pushNamed(context, ReportListView.routeName);
          },
        ),
      ),
    );
  }
}
