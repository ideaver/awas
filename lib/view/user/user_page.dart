import '../../res/widgets/ktabbar_widget.dart';
import '../../res/widgets/point_transaction_list_widget.dart';
import '../../res/theme/colors/light_colors.dart';

import '/res/widgets/kcard_widget.dart';
import '/res/widgets/kelevated_button.dart';
import '/res/widgets/report_list_widget.dart';
import '/res/widgets/profile_card_widget.dart';
import '/res/widgets/user_form_widget.dart';

import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  static const String routeName = '/profile';

  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  ScrollController scrollController = ScrollController();
  bool isFabVisible = true;

//TODO: Extract from and move FAB to form only
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
    scrollController = ScrollController();
    scrollController.addListener(() {
      // FAB should be visible if and only if user has not scrolled to bottom
      var userHasScrolledToBottom = scrollController.position.atEdge &&
          scrollController.position.pixels > 0;

      if (isFabVisible == userHasScrolledToBottom) {
        setState(() => isFabVisible = !userHasScrolledToBottom);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(),
        controller: scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [sliverAppBarWidget()];
        },
        body: TabBarView(
            physics: const BouncingScrollPhysics(),
            controller: tabController,
            children: [
              const UserFormWidget(),
              ReportListWidget(context: context),
              const PointTransactionListWidget()
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AnimatedSlide(
        duration: const Duration(milliseconds: 300),
        offset: isFabVisible ? const Offset(0, 2) : Offset.zero,
        child: KelevatedButtonWidget.floating(
          title: 'Save Changes',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Container profileDetailsWidget() {
    return Container(
      color: LightColors.kGreyColor,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(defaultMargin),
        children: [
          const SizedBox(
            height: defaultMargin,
          ),
          userDetailsCardWidget(),
          const SizedBox(
            height: defaultMargin,
          ),
          userDetailsCardWidget()
        ],
      ),
    );
  }

  KcardWidget userDetailsCardWidget() {
    return KcardWidget(
        color: LightColors.kBackgroundColor,
        elevation: 0.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '      Antoni Sudarsono',
              style: LightColors.blackTextStyle
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
            const SizedBox(
              height: defaultMargin,
            ),
            dataTable2Widget(),
          ],
        ));
  }

  DataTable dataTable2Widget() {
    return DataTable(
      headingRowHeight: 0.0,
      dataTextStyle: LightColors.blackTextStyle.copyWith(fontSize: 12),
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
        DataRow(
          cells: [
            DataCell(Text(
              'Employee Rank',
              style: LightColors.blackTextStyle
                  .copyWith(fontSize: 12.0, fontWeight: FontWeight.bold),
            )),
            const DataCell(Text(': 19')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Crew Rank',
                style: LightColors.blackTextStyle
                    .copyWith(fontSize: 12.0, fontWeight: FontWeight.bold))),
            const DataCell(Text(': 43')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Vessel',
                style: LightColors.blackTextStyle
                    .copyWith(fontSize: 12.0, fontWeight: FontWeight.bold))),
            const DataCell(Text(': 27')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Office',
                style: LightColors.blackTextStyle
                    .copyWith(fontSize: 12.0, fontWeight: FontWeight.bold))),
            const DataCell(Text(': 27')),
          ],
        ),
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
              const Icon(Icons.chevron_right, color: LightColors.kWhiteColor),
            ],
          ),
        ),
      )
    ]));
  }

  SliverAppBar sliverAppBarWidget() {
    return SliverAppBar(
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
            style: LightColors.titleTextStyle.copyWith(fontSize: 18.0),
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
      bottom: KtabBarWidget(
        controller: tabController,
        titles: const ['Details', 'Reports', 'Points'],
      ),
    );
  }
}
