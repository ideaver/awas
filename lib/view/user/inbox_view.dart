import 'package:awas_core/res/widgets/animation_search_bar_widget.dart';
import 'package:awas_core/res/widgets/kappbar_widget.dart';
import 'package:awas_core/res/widgets/kdivider_widget.dart';
import 'package:awas_core/res/widgets/ktabbar_widget.dart';
import 'package:awas_core/res/widgets/title_sepatator_widget.dart';

import '../report/report_details_view.dart';

import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

import 'chat_room_view.dart';

class InboxView extends StatefulWidget {
  static const String routeName = '/inbox';

  const InboxView({super.key});

  @override
  State<InboxView> createState() => _InboxViewState();
}

class _InboxViewState extends State<InboxView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
    controller = TextEditingController();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kGreyColor,
      // appBar: PreferredSize(
      //   preferredSize: const Size(double.infinity, 116),
      //   child: SafeArea(
      //     child: Column(
      //       children: [
      //         Container(
      //           decoration: const BoxDecoration(
      //             color: LightColors.kBackgroundColor,
      //           ),
      //           alignment: Alignment.center,
      //           child: AnimationSearchBarWidget(
      //             textStyle: LightColors.titleTextStyle.copyWith(
      //               fontSize: 18.0,
      //             ),
      //             closeIconColor: LightColors.kDarkGreyColor,
      //             hintStyle: LightColors.subTitle2TextStyle,
      //             backIconColor: LightColors.kDarkGreyColor,
      //             searchIconColor: LightColors.kDarkGreyColor,
      //             centerTitle: 'Inbox',
      //             onChanged: (text) {
      //               // TODO
      //             },
      //             searchTextEditingController: controller,
      //             horizontalPadding: defaultMargin / 2,
      //           ),
      //         ),
      //         Container(
      //           decoration: const BoxDecoration(
      //             color: LightColors.kBackgroundColor,
      //           ),
      //           child: KtabBarWidget(
      //             isScrollable: true,
      //             controller: tabController,
      //             labelIcon: Container(
      //               margin: const EdgeInsets.only(left: 5),
      //               padding: const EdgeInsets.all(5),
      //               decoration: const BoxDecoration(
      //                   color: LightColors.kRed, shape: BoxShape.circle),
      //               child: Text(
      //                 '12',
      //                 style: LightColors.whiteTextStyle.copyWith(
      //                     fontSize: 10.0, fontWeight: FontWeight.bold),
      //               ),
      //             ),
      //             titles: const ['All', 'Alert', 'Chat', 'Mention'],
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      appBar: KappBarWidget(
        context: context,
        titleWidget: Container(
          decoration: const BoxDecoration(
            color: LightColors.kBackgroundColor,
          ),
          alignment: Alignment.center,
          child: AnimationSearchBarWidget(
            textStyle: LightColors.titleTextStyle.copyWith(
              fontSize: 18.0,
            ),
            closeIconColor: LightColors.kDarkGreyColor,
            hintStyle: LightColors.subTitle2TextStyle,
            backIconColor: LightColors.kDarkGreyColor,
            searchIconColor: LightColors.kDarkGreyColor,
            centerTitle: 'Inbox',
            onChanged: (text) {
              // TODO
            },
            searchTextEditingController: controller,
            horizontalPadding: defaultMargin / 2,
          ),
        ),
        bottom: KtabBarWidget(
          isScrollable: true,
          controller: tabController,
          labelIcon: Container(
            margin: const EdgeInsets.only(left: 5),
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: LightColors.kRed,
              shape: BoxShape.circle,
            ),
            child: Text(
              '12',
              style: LightColors.whiteTextStyle.copyWith(
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          titles: const ['All', 'Alert', 'Chat', 'Mention'],
        ),
      ),
      body: TabBarView(
        physics: const BouncingScrollPhysics(),
        controller: tabController,
        children: [
          listViewBuilderWidget(),
          listViewBuilderWidget(),
          listViewBuilderWidget(),
          listViewBuilderWidget()
        ],
      ),
    );
  }

  ListView listViewBuilderWidget() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 20,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return const TitleSeparatorWidget(title: 'recently');
          case 8:
            return const TitleSeparatorWidget(title: 'older');
          case 19: //should be last
            return Image.asset(
              'assets/logo.png',
              scale: 3,
            );
        }

        return Column(
          children: [
            ListTile(
              onTap: () {
                if (tabController.index == 2) {
                  Navigator.pushNamed(context, ChatRoomView.routeName);
                } else {
                  Navigator.pushNamed(context, ReportDetailsView.routeName);
                }
              },
              tileColor: index > 3
                  ? LightColors.kBackgroundColor
                  : LightColors.kInfoColor.withOpacity(0.1),
              contentPadding: const EdgeInsets.symmetric(
                vertical: defaultMargin / 3,
                horizontal: defaultMargin,
              ),
              leading: const CircleAvatar(
                backgroundImage: AssetImage('assets/avatar1.png'),
                radius: 25,
                backgroundColor: LightColors.kWhiteColor,
              ),
              title: Text(
                'Near Miss Report',
                style: LightColors.blackTextStyle
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Laborum do mollit nostrud Laborum do mollit nostrud Laborum do mollit nostrud ...',
                overflow: TextOverflow.ellipsis,
                style: LightColors.subTitle2TextStyle,
              ),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${index}m ago',
                    style: LightColors.subTitle3TextStyle
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  index < 4
                      ? Container(
                          margin: const EdgeInsets.only(top: defaultMargin / 4),
                          width: defaultMargin / 2,
                          height: defaultMargin / 2,
                          decoration: const BoxDecoration(
                            color: LightColors.kPrimaryColor,
                            shape: BoxShape.circle,
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
            const KdividerWidget(horizontalMargin: 0.0),
          ],
        );
      },
    );
  }
}
