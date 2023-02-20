// ignore_for_file: use_key_in_widget_constructors

import 'package:awas/view/user/chat_room_page.dart';

import '/res/utils/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../state_management/global_states.dart';
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

class UserPage extends ConsumerStatefulWidget {
  final PageStateEnum userPageState;
  static const String routeName = '/profile';
  static const String editModerouteName = '/profile-edit';
  static const String viewAsMeRouteName = '/profile-me';
  static const String viewAsOtherRouteName = '/profile-user';

  const UserPage({super.key, required this.userPageState});
  const UserPage.edit() : this(userPageState: PageStateEnum.edit);
  const UserPage.viewAsMe() : this(userPageState: PageStateEnum.viewAsMe);
  const UserPage.viewAsOther() : this(userPageState: PageStateEnum.viewAsOther);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserPageState();
}

class _UserPageState extends ConsumerState<UserPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  ScrollController scrollController = ScrollController();

  final Map<String, String> profileInfoData = {
    'Date Joined': '12 Des 2022',
    'Status': 'Active',
    'Position': 'Employee',
    'Last Login': 'Today'
  };

  final Map<String, String> activityInfo = {
    'Total Reports': '21345',
    'Total Points Trx': '456',
    'Total Redeem points': '7',
    'Total minus points': '67',
    'Last Point Redeem': ' 6 oct 2021'
  };

  @override
  void initState() {
    //scroll controller for UserFormWidget
    scrollController = ScrollController();
    scrollController.addListener(() {
      // FAB should be visible if and only if user has not scrolled to bottom
      var userHasScrolledToBottom = scrollController.position.atEdge &&
          scrollController.position.pixels > 0;

      if (ref.read(isFabVisibleProvider) == userHasScrolledToBottom) {
        ref.read(isFabVisibleProvider.notifier).state =
            !userHasScrolledToBottom;
      }
    });

    super.initState();
    tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    final bool isNewUser = widget.userPageState == PageStateEnum.edit;

    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      appBar: KappBarWidget(
        systemOverlayStyle: darkStatusBar,
        context: context,
        title: widget.userPageState == PageStateEnum.viewAsOther
            ? 'User Profile'
            : 'My Profile',
        subTitle: 'ID097532858',
        actions: actions(isNewUser),
      ),
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            sliverAppBarWidget(widget.userPageState),
          ];
        },
        body: isNewUser
            ? const UserFormWidget()
            : TabBarView(
                physics: const BouncingScrollPhysics(),
                controller: tabController,
                children: [
                  widget.userPageState == PageStateEnum.viewAsMe ||
                          widget.userPageState == PageStateEnum.viewAsOther
                      ? userInfo()
                      : const UserFormWidget(),
                  ReportListWidget(context: context),
                  const PointTransactionListWidget()
                ],
              ),
      ),
    );
  }

  List<Widget> actions(bool isNewUser) {
    return isNewUser
        ? []
        : widget.userPageState == PageStateEnum.viewAsMe
            ? [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, UserPage.editModerouteName);
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: LightColors.kDarkGreyColor,
                  ),
                ),
                const SizedBox(
                  width: defaultMargin / 4,
                )
              ]
            : [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ChatRoomPage.routeName);
                    },
                    icon: const Icon(
                      Icons.chat_bubble_rounded,
                      color: LightColors.kPrimaryColor,
                    )),
                const SizedBox(
                  width: defaultMargin / 4,
                )
              ];
  }

  Widget userInfo() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
      color: LightColors.kGreyColor,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        children: [
          ...List.generate(2, (i) => userInfoCard(i)),
        ],
      ),
    );
  }

  Widget userInfoCard(int i) {
    return Padding(
      padding: const EdgeInsets.only(top: defaultMargin),
      child: KcardWidget(
        width: double.infinity,
        color: LightColors.kBackgroundColor,
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              i == 0 ? 'Profile info' : 'Activity info',
              style: LightColors.blackTextStyle,
            ),
            const SizedBox(height: defaultMargin),
            mapDataCardWidget(
              data: i == 0 ? profileInfoData : activityInfo,
            ),
          ],
        ),
      ),
    );
  }

  DataTable mapDataCardWidget({required Map<String, String> data}) {
    const Color textColor = LightColors.kBlackColor;
    return DataTable(
      headingRowHeight: 0.0,
      dataTextStyle: LightColors.whiteTextStyle.copyWith(fontSize: 12),
      dividerThickness: 0.0,
      columnSpacing: defaultMargin,
      dataRowHeight: defaultMargin,
      columns: const [
        DataColumn(
          label: SizedBox(),
        ),
        DataColumn(
          label: SizedBox(),
        ),
      ],
      rows: [
        ...List.generate(data.length, (index) {
          return DataRow(
            cells: [
              DataCell(
                Text(
                  data.entries.elementAt(index).key,
                  style: LightColors.whiteTextStyle.copyWith(
                    color: textColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataCell(
                Text(
                  ':   ${data.entries.elementAt(index).value}',
                  style: LightColors.whiteTextStyle.copyWith(
                    color: textColor,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          );
        }),
      ],
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
              const Icon(
                Icons.chevron_right,
                color: LightColors.kWhiteColor,
              ),
            ],
          ),
        ),
      )
    ]));
  }

  SliverAppBar sliverAppBarWidget(PageStateEnum userPageState) {
    final bool isNewUser = widget.userPageState == PageStateEnum.edit;
    return SliverAppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: LightColors.kBackgroundColor,
      ),
      elevation: 0.0,
      backgroundColor: LightColors.kBackgroundColor,
      pinned: true,
      expandedHeight: widget.userPageState == PageStateEnum.edit ? 230 : 280,
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
        ),
      ),
      bottom: isNewUser
          ? null
          : KtabBarWidget(
              controller: tabController,
              titles: const ['Details', 'Reports', 'Points'],
            ),
    );
  }
}
