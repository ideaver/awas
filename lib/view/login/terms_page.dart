import '/state_management/global_states.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '/res/widgets/kscrollbar_widget.dart';
import '/view/user/user_page.dart';

import '../../res/utils/globals.dart';
import '/res/theme/colors/light_colors.dart';
import '/res/widgets/kdivider_widget.dart';
import 'package:flutter/material.dart';

import '../../res/widgets/kelevated_button.dart';

class TermsPage extends StatelessWidget {
  static const String routeName = '/terms';
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Consumer(
                    builder: (context, ref, child) {
                      final icChecked = ref.watch(termsChecked);
                      return Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        value: icChecked,
                        onChanged: (value) {
                          ref.read(termsChecked.notifier).state = !icChecked;
                        },
                      );
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
                  Expanded(child: Consumer(
                    builder:
                        (BuildContext context, WidgetRef ref, Widget? child) {
                      if (!ref.watch(termsChecked)) {
                        return const KelevatedButtonWidget(title: 'Understand');
                      }
                      return KelevatedButtonWidget(
                          onPressed: () {
                            if (isLogedin) {
                              ref.read(isNewUser)
                                  ? Navigator.pushReplacementNamed(
                                      context, UserPage.editModerouteName)
                                  : Navigator.pop(context);
                            }
                            Navigator.pop(context);
                          },
                          title: 'Understand');
                    },
                  )),
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
      systemOverlayStyle: darkStatusBar,
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
