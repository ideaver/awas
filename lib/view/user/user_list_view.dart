import 'package:awas_core/res/widgets/kappbar_widget.dart';
import 'package:awas_core/res/widgets/kcard_widget.dart';
import 'package:awas_core/res/widgets/ktabbar_widget.dart';
import 'package:awas_core/res/widgets/star_badge_widget.dart';
import 'package:awas_core/res/widgets/user_custom_field_datatable_widget.dart';
import 'package:awas_core/res/widgets/user_list_widget.dart';

import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

import 'create_user_view.dart';
import 'user_view.dart';

class UserListView extends StatefulWidget {
  static const String routeName = '/user-list';

  const UserListView({super.key});

  @override
  State<UserListView> createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView>
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
          context: context,
          title: 'Employee List',
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: LightColors.kPrimaryColor,
                )),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/user-filter');
                },
                icon: const Icon(
                  Icons.filter_alt,
                  color: LightColors.kPrimaryColor,
                ))
          ],
          bottom: KtabBarWidget(
            controller: tabController,
            titles: const ['All', 'Top', 'Low'],
          ),
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
              return UserListWidget(
                onTapProfile: () {
                  Navigator.pushNamed(context, UserView.viewAsOtherRouteName);
                },
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CreateUserView.routeName);
          },
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
                padding: const EdgeInsets.symmetric(
                    vertical: defaultMargin, horizontal: defaultMargin),
                onTap: () {
                  Navigator.pushNamed(context, '/profile');
                },
                elevation: 0.0,
                color: LightColors.kBackgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Antoni Sudarsono',
                      style: LightColors.black2TextStyle,
                    ),
                    const SizedBox(
                      height: defaultMargin / 2,
                    ),
                    const UserCustomFieldDatatableWidget(
                        textColor: LightColors.kBlackColor),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
