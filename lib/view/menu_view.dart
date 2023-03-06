import 'package:awas/res/theme/colors/light_colors.dart';
import 'package:awas_core/res/utils/enums.dart';
import 'package:awas_core/res/widgets/kelevated_button.dart';

import '../res/utils/globals.dart';
import 'package:flutter/material.dart';

import 'login/login_view.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(defaultMargin),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Awas App',
                        style: LightColors.black2TextStyle.copyWith(
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(height: defaultMargin / 2),
                      Text(
                        'Awas App Prototype',
                        style: LightColors.blackTextStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: defaultMargin),
                SizedBox(
                  width: double.infinity,
                  child: KelevatedButtonWidget(
                    onPressed: () {
                      currentUserRole = RoleEnum.employee;

                      Navigator.pushNamed(
                        context,
                        LoginView.employeeRoleRouteName,
                      );
                    },
                    title: 'Login Employee',
                  ),
                ),
                const SizedBox(height: defaultMargin),
                SizedBox(
                  width: double.infinity,
                  child: KelevatedButtonWidget(
                    onPressed: () {
                      currentUserRole = RoleEnum.manager;

                      Navigator.pushNamed(
                        context,
                        LoginView.managerRoleRouteName,
                      );
                    },
                    title: 'Login Manager',
                  ),
                ),
                const SizedBox(height: defaultMargin),
                SizedBox(
                  width: double.infinity,
                  child: KelevatedButtonWidget(
                    onPressed: () {
                      currentUserRole = RoleEnum.employee;

                      Navigator.pushNamed(context, '/all-screen');
                    },
                    title: 'View All Screens',
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
