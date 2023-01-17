import 'package:awas/res/widgets/kelevated_button.dart';

import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

class ReportLoadingPage extends StatelessWidget {
  const ReportLoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: KelevatedButtonWidget.floating(
        title: 'Cancel',
        onPressed: () {},
      ),
    );
  }
}
