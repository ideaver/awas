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
      appBar: KappBarWidget.appBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            Card(
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
                                  style: LightColors.subTitle2TextStyle
                                      .copyWith(
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
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0),
                              ),
                              const SizedBox(
                                height: defaultMargin,
                              ),
                              DataTable(
                                headingRowHeight: 0.0,
                                dataTextStyle: LightColors.whiteTextStyle
                                    .copyWith(fontSize: 12),
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
                                            .copyWith(
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold),
                                      )),
                                      const DataCell(Text(': 19')),
                                    ],
                                  ),
                                  DataRow(
                                    cells: [
                                      DataCell(Text('Crew Rank',
                                          style: LightColors.whiteTextStyle
                                              .copyWith(
                                                  fontSize: 12.0,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      const DataCell(Text(': 43')),
                                    ],
                                  ),
                                  DataRow(
                                    cells: [
                                      DataCell(Text('Vessel',
                                          style: LightColors.whiteTextStyle
                                              .copyWith(
                                                  fontSize: 12.0,
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      const DataCell(Text(': 27')),
                                    ],
                                  ),
                                  DataRow(
                                    cells: [
                                      DataCell(Text('Office',
                                          style: LightColors.whiteTextStyle
                                              .copyWith(
                                                  fontSize: 12.0,
                                                  fontWeight:
                                                      FontWeight.bold))),
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
                )),
            Expanded(
                child: ListView(
              physics: const BouncingScrollPhysics(),
            )),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          KfloatingActionButton(onPressed: () {}, title: 'Save Changes'),
    );
  }
}
