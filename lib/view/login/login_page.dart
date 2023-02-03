import 'package:awas/view/login/terms_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../res/utils/globals.dart';
import '../../state_management/global_states.dart';
import '/res/utils/enums.dart';
import '/view/dashboard/dashboard_employee_page.dart';
import '/view/user/user_page.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
//TODO: implement session manager

import '/res/widgets/ktext_form_field.dart';
import 'package:flutter/material.dart';

import '../../res/theme/colors/light_colors.dart';
import '../../res/widgets/kelevated_button.dart';

class LoginPage extends StatelessWidget {
  final Role loginRole;
  static const String routeName = '/login';
  static const String employeeRoleRouteName = '/employee-login';

//Constructors
  const LoginPage({super.key, required this.loginRole});
  const LoginPage.employeeRole()
      : this(
          loginRole: Role.employee,
        );

  @override
  Widget build(BuildContext context) {
    SystemChrome.restoreSystemUIOverlays();
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
                  Consumer(
                    builder: (context, ref, child) {
                      return KelevatedButtonWidget(
                          onPressed: () {
                            isLogedin = true;
                            loginRoleAndIsNewUser(context, ref);
                          },
                          title: 'Sign In');
                    },
                  ),
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

  void loginRoleAndIsNewUser(BuildContext context, WidgetRef ref) {
    switch (loginRole) {
      case Role.employee:
        ref.read(isNewUser)
            ? Navigator.pushReplacementNamed(context, TermsPage.routeName)
            : Navigator.pushReplacementNamed(
                context, DashboardEmployeePage.routeName);
        break;
      case Role.manager:
        break;
      case Role.superUser:
        break;
      default:
    }
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
                'Welcome to AwaS app',
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
