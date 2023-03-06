import 'package:awas_core/view/user/create_user_page.dart';

import 'package:flutter/material.dart';

class CreateUserView extends StatelessWidget {
  static const String routeName = '/create-user';

  const CreateUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateUserPage(
      onTapSaveButton: () {
        // TODO
      },
    );
  }
}
