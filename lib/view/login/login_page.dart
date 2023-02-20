// ignore_for_file: use_key_in_widget_constructors

import 'package:awas/res/utils/url_launcher.dart';
import 'package:awas/res/widgets/kbottom_navigation_bar.dart';
import 'package:awas/view/company/company_onboarding_page.dart';
import 'package:awas/view/login/terms_page.dart';
import 'package:awas/view/report/camera_page.dart';
import 'package:awas/view/user/user_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../res/utils/globals.dart';
import '../../state_management/global_states.dart';
import '/res/utils/enums.dart';
import '/view/dashboard/dashboard_employee_page.dart';
//TODO: implement session manager

import '/res/widgets/ktext_form_field.dart';
import 'package:flutter/material.dart';

import '../../res/theme/colors/light_colors.dart';
import '../../res/widgets/kelevated_button.dart';

class LoginPage extends StatelessWidget {
  final RoleEnum loginRole;
  static const String routeName = '/login';
  static const String employeeRoleRouteName = '/employee-login';
  static const String managerRoleRouteName = '/manager-login';
  static const String companyRoleRouteName = '/company-login';
  static const String superUserRoleRouteName = '/super-user-login';

//Constructors
  const LoginPage({super.key, required this.loginRole});
  const LoginPage.employeeRole()
      : this(
          loginRole: RoleEnum.employee,
        );

  const LoginPage.managerRole()
      : this(
          loginRole: RoleEnum.manager,
        );

  const LoginPage.superUserRole()
      : this(
          loginRole: RoleEnum.superUser,
        );

  const LoginPage.company()
      : this(
          loginRole: RoleEnum.company,
        );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: LightColors.kBackgroundColor,
      ),
    );
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      body: Stack(
        children: [
          Image.asset(
            'assets/bg1.jpeg',
          ), //TODO: change to scrollable inseted of fixed
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              width: MediaQuery.of(context).size.width,
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
                  const SizedBox(height: defaultMargin),
                  const KtextFormFieldWidget(
                    icon: Icons.email,
                    title: 'Email',
                  ),
                  const SizedBox(height: defaultMargin),
                  KtextFormFieldWidget.password(
                    title: 'Password',
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/forgot-password');
                      },
                      child: Text(
                        'Forgot Password?',
                        style: LightColors.linkTextStyle,
                      ),
                    ),
                  ),
                  const SizedBox(height: defaultMargin),
                  Row(
                    children: [
                      Consumer(
                        builder: (context, ref, child) {
                          final icChecked = ref.watch(termsCheckedProvider);
                          return Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            value: icChecked,
                            onChanged: (value) {
                              ref.read(termsCheckedProvider.notifier).state =
                                  !icChecked;
                            },
                          );
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I have read',
                            style: LightColors.subTitle2TextStyle.copyWith(
                              color: LightColors.kBlackColor,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/terms');
                            },
                            child: Text(
                              'Terms & Conditions',
                              style: LightColors.linkTextStyle,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultMargin),
                  Consumer(
                    builder: (context, ref, child) {
                      return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: KelevatedButtonWidget(
                          onPressed: () {
                            isLogedin = true;
                            loginRoleAndIsNewUser(context, ref);
                          },
                          title: 'Sign In',
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: defaultMargin),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: KelevatedButtonWidget(
                      backgroundColor: LightColors.kDarkGreyColor,
                      icon: Icons.camera_alt,
                      iconSize: 18,
                      onPressed: () {
                        Navigator.pushNamed(context, CameraPage.routeName);
                      },
                      title: 'Offline Report',
                    ),
                  ),
                  const SizedBox(height: defaultMargin),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont have an Account?',
                        style: LightColors.subTitle2TextStyle.copyWith(
                          fontSize: 14,
                          color: LightColors.kBlackColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // TODO
                          String phone = "62855335566";
                          String parsedMessage =
                              'Halo, can i get my Account please?';

                          UrlLauncher.whatsapp(
                            phone: phone,
                            message: parsedMessage,
                          );
                        },
                        child: Text(
                          'Ask Manager',
                          style:
                              LightColors.linkTextStyle.copyWith(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultMargin / 2),
                  Text(
                    'Or',
                    style: LightColors.subTitle2TextStyle.copyWith(
                      fontSize: 14,
                      color: LightColors.kBlackColor,
                    ),
                  ),
                  const SizedBox(height: defaultMargin),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: KelevatedButtonWidget(
                      backgroundColor: LightColors.kRed,
                      trailingIcon: Icons.keyboard_arrow_right,
                      iconSize: 18,
                      onPressed: () {
                        Navigator.pushNamed(
                            context, CompanyOnboarding.routeName);
                      },
                      title: 'Register Company',
                    ),
                  ),
                  const SizedBox(height: defaultMargin / 2),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Free 30 Day Trial',
                      style: LightColors.subTitle2TextStyle.copyWith(
                        fontSize: 14,
                        color: LightColors.kBlackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void loginRoleAndIsNewUser(BuildContext context, WidgetRef ref) {
    switch (loginRole) {
      case RoleEnum.employee:
        ref.read(isNewUserProvider)
            ? Navigator.pushReplacementNamed(context, TermsPage.routeName)
            : Navigator.pushReplacementNamed(
                context, DashboardEmployeePage.routeName);
        break;
      case RoleEnum.manager:
        Navigator.pushReplacementNamed(context, UserPage.editModerouteName);
        break;
      case RoleEnum.superUser:
        Navigator.pushReplacementNamed(context, KbottomNavigationBar.routeName);
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
