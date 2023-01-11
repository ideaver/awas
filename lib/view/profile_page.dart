import '/res/widgets/kfloating_action_button.dart';
import '/res/widgets/ktext_form_field.dart';
import 'package:flutter/material.dart';

import '../res/theme/colors/light_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      body: Stack(children: [
        Image.network(
          'https://images.unsplash.com/photo-1552879890-3a06dd3a06c2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzM4Mzh8MHwxfHNlYXJjaHwyM3x8c2hpcHBpbmclMjBzYWZldHl8ZW58MHx8fHwxNjcyNjUyODY2&ixlib=rb-4.0.3&q=200&w=700',
          fit: BoxFit.cover,
          height: 400,
        ),
        Positioned(
          top: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),

              foregroundColor: LightColors.kSecondaryColor, // <-- Splash color
            ),
            child: const Icon(Icons.arrow_back, color: LightColors.kWhiteColor),
          ),
        ),
        Stack(children: [
          Positioned(
            top: 300,
            height: 650,
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: LightColors.kBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(defaultCircular),
                      topRight: Radius.circular(defaultCircular))),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(defaultMargin),
                children: [
                  logoAndTextWidget(),
                  const SizedBox(height: defaultMargin * 2),
                  const KtextFormFieldWidget(icon: Icons.email, title: 'Email'),
                  const SizedBox(height: defaultMargin),
                  const SizedBox(height: defaultMargin),
                ],
              ),
            ),
          ),
        ])
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          KfloatingActionButton(onPressed: () {}, title: 'Sign In'),
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
