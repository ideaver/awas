import 'package:awas/res/utils/enums.dart';

import '/res/widgets/kappbar_widget.dart';
import 'package:flutter/services.dart';

import '../../res/utils/globals.dart';
import '../../res/widgets/ktabbar_widget.dart';
import '../../res/widgets/point_transaction_list_widget.dart';
import '../../res/theme/colors/light_colors.dart';

import '/res/widgets/kcard_widget.dart';

import '/res/widgets/report_list_widget.dart';
import '/res/widgets/profile_card_widget.dart';
import '/res/widgets/user_form_widget.dart';

import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  //TODO: implement view by self vs by other
  final UserPageState userPageState;
  static const String routeName = '/profile';
  static const String editModerouteName = '/profile-edit';
  static const String viewAsMerouteName = '/profile-viewMe';
  static const String viewAsOtherrouteName = '/profile-view';

  const UserPage({super.key, required this.userPageState});
  const UserPage.editMode() : this(userPageState: UserPageState.edit);
  const UserPage.viewAsMe() : this(userPageState: UserPageState.viewAsMe);
  const UserPage.viewAsOther() : this(userPageState: UserPageState.viewAsOther);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    final bool isNewUser = widget.userPageState == UserPageState.edit;
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      appBar: KappBarWidget(
        context: context,
        title: 'My Profile',
        subTitle: 'ID097532858',
        actions: isNewUser
            ? []
            : [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Log out',
                      style: LightColors.subTitle2TextStyle,
                    ))
              ],
      ),
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [sliverAppBarWidget(widget.userPageState)];
        },
        body: isNewUser
            ? const UserFormWidget()
            : TabBarView(
                physics: const BouncingScrollPhysics(),
                controller: tabController,
                children: [
                    const UserFormWidget(),
                    ReportListWidget(context: context),
                    const PointTransactionListWidget()
                  ]),
      ),
    );
  }

  SliverList sliverListWidget() {
    return SliverList(
        delegate: SliverChildListDelegate([
      SizedBox(
        height: 100,
        child: KcardWidget(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.account_circle,
                color: LightColors.kWhiteColor,
              ),
              Text(
                'Please Complete your profile first',
                style: LightColors.whiteTextStyle,
              ),
              const Icon(Icons.chevron_right, color: LightColors.kWhiteColor),
            ],
          ),
        ),
      )
    ]));
  }

  SliverAppBar sliverAppBarWidget(UserPageState userPageState) {
    final bool isNewUser = widget.userPageState == UserPageState.edit;
    return SliverAppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: LightColors.kBackgroundColor),
      elevation: 0.0,
      backgroundColor: LightColors.kBackgroundColor,
      pinned: true,
      expandedHeight: widget.userPageState == UserPageState.edit ? 230 : 280,
      toolbarHeight: 0,
      collapsedHeight: 15,
      flexibleSpace: FlexibleSpaceBar(
          stretchModes: const [StretchMode.blurBackground],
          background: Padding(
            padding: EdgeInsets.only(
                left: defaultMargin,
                right: defaultMargin,
                bottom: isNewUser ? defaultMargin : 80),
            child: const ProfileCardWidget(),
          )),
      bottom: isNewUser
          ? null
          : KtabBarWidget(
              controller: tabController,
              titles: const ['Details', 'Reports', 'Points'],
            ),
    );
  }
}
