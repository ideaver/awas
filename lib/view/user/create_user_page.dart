import '../../res/widgets/profile_card_widget.dart';
import '/res/theme/colors/light_colors.dart';
import '/res/widgets/kappbar_widget.dart';
import '/res/widgets/user_form_widget.dart';
import 'package:flutter/material.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      appBar: KappBarWidget(title: 'Create Employee/Manager', context: context),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                elevation: 0.0,
                backgroundColor: LightColors.kBackgroundColor,
                toolbarHeight: 52,
                leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.chevron_left_rounded,
                      color: LightColors.kDarkGreyColor,
                      size: 30,
                    )),
                title: Row(
                  children: [
                    Text(
                      'My Profile',
                      style:
                          LightColors.titleTextStyle.copyWith(fontSize: 18.0),
                    ),
                    Text(
                      ' ID 978238959325',
                      style: LightColors.subTitle2TextStyle,
                    )
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Log out',
                        style: LightColors.subTitle2TextStyle,
                      ))
                ],
                pinned: true,
                expandedHeight: 350,
                flexibleSpace: const FlexibleSpaceBar(
                    stretchModes: [StretchMode.blurBackground],
                    background: Padding(
                      padding: EdgeInsets.only(
                          top: 120,
                          left: defaultMargin,
                          right: defaultMargin,
                          bottom: 80),
                      child: ProfileCardWidget(),
                    )),
              )
            ];
          },
          body: const UserFormWidget()),
    );
  }
}
