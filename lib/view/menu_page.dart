import 'package:awas/res/theme/colors/light_colors.dart';

import '../res/utils/enums.dart';
import '../res/utils/globals.dart';
import '/res/widgets/kelevated_button.dart';
import 'package:flutter/material.dart';

import 'login/login_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

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
                KelevatedButtonWidget(
                    onPressed: () {
                      currentUserRole = Role.employee;

                      Navigator.pushNamed(
                          context, LoginPage.employeeRoleRouteName);
                    },
                    title: 'Login Employee'),
                KelevatedButtonWidget(
                    onPressed: () {
                      currentUserRole = Role.manager;

                      Navigator.pushNamed(
                        context,
                        LoginPage.managerRoleRouteName,
                      );
                    },
                    title: 'Login Manager'),
                KelevatedButtonWidget(
                    onPressed: () {
                      currentUserRole = Role.superUser;

                      Navigator.pushNamed(
                        context,
                        LoginPage.superUserRoleRouteName,
                      );
                    },
                    title: 'Login SuperUser'),
                KelevatedButtonWidget(
                  onPressed: () {
                    currentUserRole = Role.employee;

                    Navigator.pushNamed(context, '/all-screen');
                  },
                  title: 'View All Screens',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
