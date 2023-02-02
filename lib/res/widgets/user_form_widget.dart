import '/state_management/global_states.dart';
import '/view/thank_you_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';
import 'company_custom_field_widget.dart';
import 'kcard_widget.dart';
import 'kelevated_button.dart';
import 'ktext_form_field.dart';

class UserFormWidget extends ConsumerStatefulWidget {
  const UserFormWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends ConsumerState<UserFormWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: ListView(
          physics: const NeverScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
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
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Consumer(
        builder: (context, ref, child) {
          // if (!ref.read(isFabVisible)) {
          //   return SizedBox();
          // }
          return AnimatedSlide(
            duration: const Duration(milliseconds: 300),
            offset: ref.read(isFabVisible) ? const Offset(0, 2) : Offset.zero,
            child: KelevatedButtonWidget.floating(
              title: 'Save Changes',
              onPressed: () {
                ref.read(isNewUser)
                    ? Navigator.pushReplacementNamed(
                        context, ThankYouPage.profileUpdaterouteName)
                    : Navigator.pop(context);
              },
            ),
          );
        },
      ),
    );
  }
}
