import 'package:awas/res/utils/globals.dart';
import 'package:awas/view/thank_you_page.dart';
import '/view/dashboard/dashboard_employee_page.dart';
import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';
import 'company_custom_field_widget.dart';
import 'kbottom_navigation_bar.dart';
import 'kcard_widget.dart';
import 'kelevated_button.dart';
import 'ktext_form_field.dart';

class UserFormWidget extends StatefulWidget {
  const UserFormWidget({super.key});

  @override
  State<UserFormWidget> createState() => _UserFormWidgetState();
}

class _UserFormWidgetState extends State<UserFormWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  ScrollController scrollController = ScrollController();
  bool isFabVisible = false; //TODO: add form button using riverpod.set to false

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      // FAB should be visible if and only if user has not scrolled to bottom
      var userHasScrolledToBottom = scrollController.position.atEdge &&
          scrollController.position.pixels > 0;

      if (isFabVisible == userHasScrolledToBottom) {
        setState(() => isFabVisible = !userHasScrolledToBottom);
      }
    });
    super.initState();
  }

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
      floatingActionButton: AnimatedSlide(
        duration: const Duration(milliseconds: 300),
        offset: isFabVisible ? const Offset(0, 2) : Offset.zero,
        child: KelevatedButtonWidget.floating(
          title: 'Save Changes',
          onPressed: () {
            isNewUser
                ? Navigator.pushReplacementNamed(
                    context, ThankYouPage.profileUpdaterouteName)
                : Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
