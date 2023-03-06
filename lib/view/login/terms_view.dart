import 'package:awas_core/view/login/terms_page.dart';

import 'package:flutter/material.dart';

import '../user/user_view.dart';

class TermsView extends StatelessWidget {
  static const String routeName = '/terms';

  const TermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return TermsPage(
      onTapAcceptButton: () {
        Navigator.pushNamed(
          context,
          UserView.editUserRouteName,
        );
      },
    );
  }
}
