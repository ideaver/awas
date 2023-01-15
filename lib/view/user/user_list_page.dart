import 'package:awas/res/widgets/kelevated_button.dart';
import 'package:awas/res/widgets/star_badge_widget.dart';

import '/res/theme/colors/light_colors.dart';
import '/res/widgets/kappbar_widget.dart';
import '/res/widgets/ktabbar_widget.dart';
import 'package:flutter/material.dart';

import '../../res/widgets/kcard_widget.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: KappBarWidget(
          title: 'Employee List',
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: LightColors.kPrimaryColor,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.filter_alt,
                  color: LightColors.kPrimaryColor,
                ))
          ],
          bottom: KtabBarWidget(
              controller: tabController, titles: const ['All', 'Top', 'Low']),
        ),
        body: Scaffold(
          backgroundColor: LightColors.kGreyColor,
          body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(defaultMargin),
            itemCount: 20,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Text(
                  '235 Records found',
                  style: LightColors.subTitle2TextStyle,
                );
              }
              return listTileWidget();
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: LightColors.kWhiteColor,
          ),
        ));
  }

  Padding listTileWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: defaultMargin),
      child: Row(
        children: [
          Column(
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage('assets/avatar1.png'),
                radius: 25,
                backgroundColor: LightColors.kSecondaryColor,
              ),
              SizedBox(height: defaultMargin),
              StarBadgeWidget(),
            ],
          ),
          const SizedBox(
            width: defaultMargin / 2,
          ),
          Expanded(
            child: KcardWidget(
                padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
                onTap: () {},
                elevation: 0.0,
                color: LightColors.kBackgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Safe Observation',
                          style: LightColors.black2TextStyle,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.sync,
                          color: LightColors.kSecondaryColor,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: defaultMargin / 2,
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      'Laborum aliqua do nostrud ss ewsgvsg',
                      style: LightColors.subTitle3TextStyle,
                    ),
                    const SizedBox(
                      height: defaultMargin / 2,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.near_me,
                          color: LightColors.kPrimaryColor,
                          size: 20,
                        ),
                        const SizedBox(
                          width: defaultMargin / 2,
                        ),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          'North Mining Site',
                          style: LightColors.subTitle2TextStyle,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: defaultMargin,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.forum,
                          color: LightColors.kDarkGreyColor,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '0',
                          style: LightColors.subTitle2TextStyle,
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.share,
                          color: LightColors.kDarkGreyColor,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '0',
                          style: LightColors.subTitle2TextStyle,
                        )
                      ],
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
