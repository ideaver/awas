import 'package:flutter_session_manager/flutter_session_manager.dart';

import 'package:awas/res/widgets/ktext_form_field.dart';
import 'package:flutter/material.dart';

import '../../res/theme/colors/light_colors.dart';
import '../../res/widgets/kelevated_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      body: Stack(children: [
        Image.asset(
          'assets/bg1.jpeg',
        ), //TODO: change to scrollable inseted of fixed
        Stack(children: [
          Positioned(
            top: 200,
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
                  const SizedBox(height: defaultMargin),
                  const KtextFormFieldWidget(icon: Icons.email, title: 'Email'),
                  const SizedBox(height: defaultMargin),
                  KtextFormFieldWidget.password(title: 'Password'),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgot-password');
                        },
                        child: Text(
                          'Forgot Password?',
                          style: LightColors.linkTextStyle,
                        )),
                  ),
                  const SizedBox(height: defaultMargin),
                  KelevatedButtonWidget(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/profile');
                      },
                      title: 'Sign In'),
                  const SizedBox(height: defaultMargin),
                  KelevatedButtonWidget(
                      backgroundColor: LightColors.kDarkGreyColor,
                      onPressed: () {},
                      title: 'Offline Report'),
                  const SizedBox(height: defaultMargin),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'I have read',
                        style: LightColors.subTitle2TextStyle,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/terms');
                          },
                          child: Text(
                            'Terms & Conditions',
                            style: LightColors.linkTextStyle,
                          )),
                    ],
                  ),
                  const SizedBox(height: defaultMargin),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an Account?',
                        style: LightColors.subTitle2TextStyle
                            .copyWith(fontSize: 14),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Ask Manager',
                            style: LightColors.linkTextStyle
                                .copyWith(fontSize: 14),
                          )),
                    ],
                  ),
                  const SizedBox(height: defaultMargin * 4),
                ],
              ),
            ),
          ),
        ])
      ]),
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
                'Hello!',
                style: LightColors.titleTextStyle,
              ),
              Text(
                'Welcome to AWAS app',
                overflow: TextOverflow.visible,
                style: LightColors.subTitleTextStyle,
              ),
              Text(
                'Awareness for Safety-Application',
                overflow: TextOverflow.visible,
                style: LightColors.subTitleTextStyle.copyWith(fontSize: 14),
              ),
            ],
          ),
        )
      ],
    );
  }

  //TODO: implement login save

  //   savePref(BuildContext context,String? id) async {
  //   await SessionManager().set("id", id).then((value) =>
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (BuildContext context) => home())));
  // }

  // Future<void> checksession(BuildContext context) async {
  //   dynamic id = await SessionManager().get("id").then((value) =>
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (BuildContext context) => home())));
  // }

}
