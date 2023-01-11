import '../res/widgets/appbar_widget.dart';
import '/res/widgets/kfloating_action_button.dart';
import 'package:flutter/material.dart';

import '../res/theme/colors/light_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      body: DefaultTabController(
        length: 2,
        child: CustomScrollView(slivers: [
          SliverAppBar(
            elevation: 0.0,
            backgroundColor: LightColors.kBackgroundColor,
            toolbarHeight: 50,
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
            expandedHeight: 340,
            flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [StretchMode.blurBackground],
                background: Padding(
                  padding: const EdgeInsets.only(
                      top: 120,
                      left: defaultMargin,
                      right: defaultMargin,
                      bottom: 70),
                  child: cardProfileWidget(),
                )),
            bottom: TabBar(
                labelPadding: const EdgeInsets.symmetric(
                    horizontal: defaultMargin, vertical: defaultMargin / 2),
                tabs: [
                  Text('faf',
                      style: LightColors.titleTextStyle.copyWith(
                          fontSize: 14.0, fontWeight: FontWeight.bold)),
                  Text('fassfaf'),
                  Text('fassfaf')
                ]),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          )
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          KfloatingActionButton(onPressed: () {}, title: 'Save Changes'),
    );
  }

  Card cardProfileWidget() {
    return Card(
        color: LightColors.kPrimaryColor,
        elevation: defaultMargin,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultCircular),
        ),
        child: InkWell(
          onTap: () {},
          splashColor: LightColors.kSecondaryColor,
          child: Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://cdn.visily.ai/app/production/1672195451865/static/media/F2.da2ec199.png'),
                      radius: 35,
                      backgroundColor: LightColors.kWhiteColor,
                    ),
                    const SizedBox(
                      height: defaultMargin,
                    ),
                    Chip(
                        avatar: const Icon(
                          Icons.star,
                          color: LightColors.kWhiteColor,
                        ),
                        elevation: defaultMargin / 4,
                        backgroundColor: LightColors.kTertiaryColor,
                        label: Text(
                          '3200',
                          style: LightColors.subTitle2TextStyle.copyWith(
                              fontWeight: FontWeight.bold,
                              color: LightColors.kWhiteColor,
                              fontSize: 12.0),
                        ))
                  ],
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        'Antoni Sudarsono',
                        style: LightColors.whiteTextStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 14.0),
                      ),
                      const SizedBox(
                        height: defaultMargin,
                      ),
                      DataTable(
                        headingRowHeight: 0.0,
                        dataTextStyle:
                            LightColors.whiteTextStyle.copyWith(fontSize: 12),
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
                                style: LightColors.whiteTextStyle.copyWith(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold),
                              )),
                              const DataCell(Text(': 19')),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Crew Rank',
                                  style: LightColors.whiteTextStyle.copyWith(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold))),
                              const DataCell(Text(': 43')),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Vessel',
                                  style: LightColors.whiteTextStyle.copyWith(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold))),
                              const DataCell(Text(': 27')),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text('Office',
                                  style: LightColors.whiteTextStyle.copyWith(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold))),
                              const DataCell(Text(': 27')),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
