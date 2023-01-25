import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';
import 'company_custom_field_widget.dart';
import 'kcard_widget.dart';
import 'ktext_form_field.dart';

class UserFormWidget extends StatelessWidget {
  const UserFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: add form button
    //TODO: add forms widget
    return ListView(
      physics:
          const NeverScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      padding: const EdgeInsets.all(defaultMargin),
      children: [
        KcardWidget.tile(
            leadingIcon: Icons.account_circle,
            title: 'Please complete your profile'),
        const SizedBox(height: defaultMargin),
        const KtextFormFieldWidget(title: 'Name'),
        const SizedBox(height: defaultMargin),
        const KtextFormFieldWidget(title: 'Phone'),
        const SizedBox(height: defaultMargin),
        const KtextFormFieldWidget(title: 'Email'),
        const SizedBox(height: defaultMargin),
        KtextFormFieldWidget.password(title: 'Password'),
        const SizedBox(height: defaultMargin),
        Text(
          'PT. Adiguna Usaha',
          style: LightColors.titleTextStyle.copyWith(fontSize: 18.0),
        ),
        const SizedBox(height: defaultMargin),
        const CompanyCustomFieldWidget(),
        const SizedBox(height: defaultMargin),
        const SizedBox(height: defaultMargin * 5),
      ],
    );
  }
}
