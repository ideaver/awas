import 'package:awas_core/view/login/forgot_password_page.dart';

import 'package:flutter/material.dart';

import '../main/main_view.dart';

class ForgotPassView extends StatelessWidget {
  static const String routeName = '/forgot-pass';

  const ForgotPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordPage(
      onTapSubmitButton: () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          MainView.routeName,
          (route) => false,
        );
      },
    );
  }
}
