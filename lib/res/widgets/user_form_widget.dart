import 'package:awas/res/widgets/image_edit_dart.dart';

import '../utils/enums.dart';
import '../utils/globals.dart';
import '/state_management/global_states.dart';
import '/view/thank_you_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';
import 'company_custom_field_widget.dart';
import 'kbottom_navigation_bar.dart';
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
            parent: BouncingScrollPhysics(),
          ),
          padding: const EdgeInsets.all(defaultMargin),
          children: [
            KcardWidget.tile(
              leadingIcon: Icons.account_circle,
              title: 'Please complete your profile below',
            ),
            const SizedBox(height: defaultMargin),
            Text(
              'Profile Picture',
              style: LightColors.subTitleTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: defaultMargin / 2),
            Row(
              children: [
                const ImageEditWidget(),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      KcardWidget(
                        elevation: 0.0,
                        color: LightColors.kBackgroundColor,
                        padding: const EdgeInsets.all(defaultMargin / 2),
                        child: Text(
                          'You can set your privacy from other employee. They will not be able to view your name and profile picture',
                          style: LightColors.subTitle3TextStyle,
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            value: false,
                            onChanged: (value) {},
                          ),
                          Expanded(
                            child: Text(
                              'Hide my privacy',
                              style: LightColors.subTitle2TextStyle,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
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
            offset: ref.read(isFabVisibleProvider)
                ? const Offset(0, 2)
                : Offset.zero,
            child: KelevatedButtonWidget.floating(
              title: 'Save Changes',
              onPressed: () {
                ref.read(isNewUserProvider)
                    ? currentUserRole == RoleEnum.manager
                        ? Navigator.pushReplacementNamed(
                            context,
                            KbottomNavigationBar.routeName,
                          )
                        : Navigator.pushReplacementNamed(
                            context,
                            ThankYouPage.profileUpdaterouteName,
                          )
                    : Navigator.pop(context);
              },
            ),
          );
        },
      ),
    );
  }
}
