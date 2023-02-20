import 'package:awas/res/widgets/kelevated_button.dart';
import 'package:flutter/services.dart';

import '/res/widgets/ktext_form_field.dart';
import 'package:flutter/material.dart';

import '../../res/theme/colors/light_colors.dart';

class ForgotPasswordPage extends StatelessWidget {
  static const String routeName = '/forgot-password';

  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: LightColors.kBackgroundColor,
      ),
    );
    //TODO : Change to sliver
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      body: Stack(
        children: [
          Image.asset(
            'assets/bg1.jpeg',
          ),
          Positioned(
            top: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                foregroundColor:
                    LightColors.kSecondaryColor, // <-- Splash color
              ),
              child: const Icon(
                Icons.arrow_back,
                color: LightColors.kWhiteColor,
              ),
            ),
          ),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Container(
                margin: const EdgeInsets.only(top: 200),
                padding: const EdgeInsets.all(defaultMargin),
                decoration: const BoxDecoration(
                  color: LightColors.kBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(defaultCircular),
                    topRight: Radius.circular(
                      defaultCircular,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    logoAndTextWidget(),
                    const SizedBox(height: defaultMargin * 2),
                    const KtextFormFieldWidget(
                      icon: Icons.email,
                      title: 'Email',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: KelevatedButtonWidget.floating(
        title: 'Sign In',
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/thank-you');
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
                'Input your email',
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
