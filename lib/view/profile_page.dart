import 'package:awas/res/widgets/kdropdown_widget.dart';

import '../res/widgets/star_badge_widget.dart';
import '/res/widgets/kcard_widget.dart';
import '/res/widgets/kelevated_button.dart';
import '/res/widgets/ktext_form_field.dart';

import '../res/widgets/appbar_widget.dart';

import 'package:flutter/material.dart';

import '../res/theme/colors/light_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ScrollController scrollController = ScrollController();
  bool isFabVisible = true;

  @override
  void initState() {
    super.initState();
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
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [sliverAppBarWidget()];
          },
          body: TabBarView(children: [
            tabBar1Widget(),
            Container(
              color: LightColors.kGreyColor,
              child: ListView(
                physics: const BouncingScrollPhysics(),
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
            ),
            const Text('gdsg')
          ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AnimatedSlide(
        duration: const Duration(milliseconds: 300),
        offset: isFabVisible ? const Offset(0, 2) : Offset.zero,
        child: KelevatedButtonWidget.floating(
          title: 'Save Changes',
          onPressed: () {},
        ),
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

  ListView tabBar1Widget() {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(defaultMargin),
      children: [
        KcardWidget(
            elevation: 0.0,
            child: Row(
              children: [
                const Icon(
                  Icons.account_circle,
                  color: LightColors.kWhiteColor,
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    'Please Complete your profile first',
                    style: LightColors.whiteTextStyle,
                  ),
                ),
                const SizedBox(width: 10.0),
                const Icon(Icons.chevron_right, color: LightColors.kWhiteColor),
              ],
            )),
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
        const KdropdownWidget(title: 'Crew Rank'),
        const SizedBox(height: defaultMargin),
        const KdropdownWidget(title: 'Employee Rank'),
        const SizedBox(height: defaultMargin),
        const KdropdownWidget(title: 'Vessel'),
        const SizedBox(height: defaultMargin),
        const KdropdownWidget(title: 'Office'),
        const SizedBox(height: defaultMargin),
        const SizedBox(height: defaultMargin * 5),
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
      toolbarHeight: 70,
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
      flexibleSpace: FlexibleSpaceBar(
          stretchModes: const [StretchMode.blurBackground],
          background: Padding(
            padding: const EdgeInsets.only(
                top: 120,
                left: defaultMargin,
                right: defaultMargin,
                bottom: 80),
            child: cardProfileWidget(),
          )),
      bottom: tabBarWidget(),
    );
  }

  TabBar tabBarWidget() {
    return TabBar(
        unselectedLabelColor: LightColors.kDarkGreyColor,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: LightColors.kPrimaryColor.withOpacity(0.2)),
        padding: const EdgeInsets.all(defaultMargin / 2),
        labelPadding: const EdgeInsets.symmetric(
            horizontal: defaultMargin, vertical: defaultMargin / 2),
        tabs: [
          Text('Details',
              style: LightColors.linkTextStyle
                  .copyWith(fontSize: 14.0, fontWeight: FontWeight.bold)),
          Text('Reports',
              style: LightColors.subTitleTextStyle
                  .copyWith(fontSize: 14.0, fontWeight: FontWeight.bold)),
          Text('Points',
              style: LightColors.subTitleTextStyle
                  .copyWith(fontSize: 14.0, fontWeight: FontWeight.bold))
        ]);
  }

  Widget cardProfileWidget() {
    return KcardWidget(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: const [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://cdn.visily.ai/app/production/1672195451865/static/media/F2.da2ec199.png'),
              radius: 35,
              backgroundColor: LightColors.kWhiteColor,
            ),
            SizedBox(
              height: defaultMargin,
            ),
            StarBadgeWidget()
          ],
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                'Antoni Sudarsono',
                style: LightColors.whiteTextStyle
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 14.0),
              ),
              const SizedBox(
                height: defaultMargin,
              ),
              dataTableWidget(),
            ],
          ),
        )
      ],
    ));
  }

  DataTable dataTableWidget() {
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
        DataRow(
          cells: [
            DataCell(Text(
              'Employee Rank',
              style: LightColors.whiteTextStyle
                  .copyWith(fontSize: 12.0, fontWeight: FontWeight.bold),
            )),
            const DataCell(Text(': 19')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Crew Rank',
                style: LightColors.whiteTextStyle
                    .copyWith(fontSize: 12.0, fontWeight: FontWeight.bold))),
            const DataCell(Text(': 43')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Vessel',
                style: LightColors.whiteTextStyle
                    .copyWith(fontSize: 12.0, fontWeight: FontWeight.bold))),
            const DataCell(Text(': 27')),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Office',
                style: LightColors.whiteTextStyle
                    .copyWith(fontSize: 12.0, fontWeight: FontWeight.bold))),
            const DataCell(Text(': 27')),
          ],
        ),
      ],
    );
  }
}
