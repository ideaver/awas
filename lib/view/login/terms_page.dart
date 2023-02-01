import 'package:awas/state_management/global_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/res/widgets/kscrollbar_widget.dart';
import '/view/user/user_page.dart';

import '../../res/utils/globals.dart';
import '/res/theme/colors/light_colors.dart';
import '/res/widgets/kdivider_widget.dart';
import 'package:flutter/material.dart';

import '../../res/widgets/kelevated_button.dart';

class TermsPage extends ConsumerWidget {
  static const String routeName = '/terms';

  const TermsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StateController<bool> isChecked = ref.watch(termsChecked.notifier);
    print('logme termspage build and ${isChecked.state}');
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      appBar: appBarWidget(),
      body: Padding(
        padding: const EdgeInsets.only(
            top: defaultMargin,
            left: defaultMargin,
            right: defaultMargin,
            bottom: defaultMargin * 10),
        child: KscrollBarWidget(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: defaultMargin,
                  ),
                  Text(
                    '${index + 1} Introduction',
                    style: LightColors.titleTextStyle.copyWith(
                        fontSize: 14.0, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(
                    height: defaultMargin / 2,
                  ),
                  Text(
                    'Ut nostrud cupidatat elit est eiusmod voluptate dolore nisi. Eiusmod deserunt sit excepteur nisi reprehenderit dolor labore magna pariatur nisi. Elit deserunt cupidatat anim consequat reprehenderit voluptate. Labore labore non consequat ut voluptate reprehenderit est. Nostrud dolore et magna tempor co. Ut nostrud cupidatat elit est eiusmod voluptate dolore nisi. Eiusmod deserunt',
                    style: LightColors.subTitle2TextStyle,
                  ),
                ],
              );
            },
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(defaultMargin),
        child: SizedBox(
          height: 150,
          child: Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    value: isChecked.state,
                    onChanged: (value) {
                      isChecked.state = !isChecked.state;
                    },
                  ),
                  Text(
                    'I have read & agree with above T&Cs',
                    style: LightColors.subTitle2TextStyle,
                  ),
                ],
              ),
              const KdividerWidget(horizontalMargin: 0),
              const SizedBox(
                height: defaultMargin,
              ),
              Row(
                children: [
                  Expanded(
                    child: KelevatedButtonWidget(
                        backgroundColor: LightColors.kWhiteColor,
                        textColor: LightColors.kPrimaryColor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        title: 'Decline'),
                  ),
                  const SizedBox(
                    width: defaultMargin,
                  ),
                  Expanded(
                      child: KelevatedButtonWidget(
                          onPressed: () {
                            isNewUser
                                ? Navigator.pushReplacementNamed(
                                    context, UserPage.routeName)
                                : Navigator.pop(context);
                          },
                          title: 'Understand')),
                ],
              ),
              const SizedBox(
                height: defaultMargin,
              ),
              const KdividerWidget(horizontalMargin: 0),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBarWidget() {
    return AppBar(
      elevation: 0,
      backgroundColor: LightColors.kBackgroundColor,
      toolbarHeight: 100,
      leadingWidth: 80,
      leading: Row(
        children: const [
          SizedBox(
            width: defaultMargin,
          ),
          Chip(
              labelPadding: EdgeInsets.all(5.0),
              backgroundColor: LightColors.kPrimaryColor,
              label: Icon(
                Icons.note,
                color: LightColors.kWhiteColor,
              )),
        ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Terms & Conditions',
            style: LightColors.titleTextStyle.copyWith(fontSize: 24.0),
          ),
          Text(
            'Update 1/8/2022',
            style: LightColors.subTitleTextStyle,
          )
        ],
      ),
      bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4.0), child: KdividerWidget()),
    );
  }
}
