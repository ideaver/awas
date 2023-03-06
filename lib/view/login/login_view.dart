import 'package:awas_core/res/utils/enums.dart';
import 'package:awas_core/res/utils/url_launcher.dart';
import 'package:awas_core/view/login/login_page.dart';

import 'package:flutter/material.dart';

import '../report/camera_view.dart';
import '../user/user_view.dart';
import 'forgot_pass_view.dart';
import 'terms_view.dart';

class LoginView extends StatelessWidget {
  final RoleEnum loginRole;

  static const String employeeRoleRouteName = '/employee-login';
  static const String managerRoleRouteName = '/manager-login';

  const LoginView({super.key, required this.loginRole});

  const LoginView.employeeRole({
    super.key,
    this.loginRole = RoleEnum.employee,
  });

  const LoginView.managerRole({
    super.key,
    this.loginRole = RoleEnum.manager,
  });

  @override
  Widget build(BuildContext context) {
    return LoginPage(
      loginRole: loginRole,
      onTapSignInButton: () {
        if (loginRole == RoleEnum.employee) {
          Navigator.pushReplacementNamed(context, TermsView.routeName);
        }

        if (loginRole == RoleEnum.manager) {
          Navigator.pushReplacementNamed(context, UserView.editUserRouteName);
        }
      },
      onTapForgotPassTextButton: () {
        Navigator.pushNamed(context, ForgotPassView.routeName);
      },
      onTapOfflineReportButton: () {
        Navigator.pushNamed(context, CameraView.routeName);
      },
      onTapRegisterCompanyButton: () {
        // TODO
      },
      onTapAskManagerButton: () {
        String phone = "62855335566";
        String parsedMessage = 'Halo, can i get my Account please?';

        UrlLauncher.whatsapp(
          phone: phone,
          message: parsedMessage,
        );
      },
    );
  }
}
