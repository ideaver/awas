import 'package:awas/res/theme/colors/light_colors.dart';
import 'package:awas/res/widgets/kappbar_widget.dart';
import 'package:flutter/material.dart';

class DashboardAdminPage extends StatelessWidget {
  DashboardAdminPage({Key? key}) : super(key: key);

  static const String routeName = '/dashboard-admin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: body(),
    );
  }

  KappBarWidget appBar(BuildContext context) {
    return KappBarWidget(
      context: context,
      centerTitle: false,
      automaticallyImplyLeading: false,
      titleWidget: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: defaultMargin),
            Image.asset('assets/logo.png', scale: 6),
            const SizedBox(width: defaultMargin / 2),
            Text(
              'Hi Admin',
              style: LightColors.titleTextStyle.copyWith(
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 0.5,
                  color: LightColors.kBlackColor.withOpacity(0.24),
                ),
              ),
            ),
            child: Row(
              children: buildRows(tableHead),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildRows(tableData),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildCells(List<List<Map<String, String>>> data, int i) {
    return List.generate(data[i].length, (j) {
      return Container(
        alignment: j == 0 ? Alignment.centerLeft : Alignment.center,
        width: j == 0 ? 140.0 : 100,
        height: 60.0,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data[i][j]['data'] ?? '',
              style: LightColors.titleTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
            data[i][j]['date'] != null
                ? Text(
                    "Registered ${data[i][j]['date']}",
                    style: LightColors.subTitle2TextStyle.copyWith(
                      fontSize: 10,
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      );
    });
  }

  List<Widget> buildRows(List<List<Map<String, String>>> data) {
    return List.generate(
      data.length,
      (i) => Container(
        color: i.isEven ? LightColors.kGreyColor : null,
        child: Row(
          children: buildCells(data, i),
        ),
      ),
    );
  }

  List<List<Map<String, String>>> tableHead = [
    [
      {'data': 'COMPANY'},
      {'data': 'REPORTS'},
      {'data': 'EMPLOYEE'},
      {'data': 'STORAGE'},
      {'data': 'AVG DAILY SESSION'},
    ],
  ];

  List<List<Map<String, String>>> tableData = [
    [
      {'data': 'Pt. Mitra Pinastika', 'date': '23 Juni 2022'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
    ],
    [
      {'data': 'Pt. Mitra Pinastika', 'date': '23 Juni 2022'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
    ],
    [
      {'data': 'Pt. Mitra Pinastika', 'date': '23 Juni 2022'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
    ],
    [
      {'data': 'Pt. Mitra Pinastika', 'date': '23 Juni 2022'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
    ],
    [
      {'data': 'Pt. Mitra Pinastika', 'date': '23 Juni 2022'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
    ],
    [
      {'data': 'Pt. Mitra Pinastika', 'date': '23 Juni 2022'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
    ],
    [
      {'data': 'Pt. Mitra Pinastika', 'date': '23 Juni 2022'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
    ],
    [
      {'data': 'Pt. Mitra Pinastika', 'date': '23 Juni 2022'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
    ],
    [
      {'data': 'Pt. Mitra Pinastika', 'date': '23 Juni 2022'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
    ],
    [
      {'data': 'Pt. Mitra Pinastika', 'date': '23 Juni 2022'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
    ],
    [
      {'data': 'Pt. Mitra Pinastika', 'date': '23 Juni 2022'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
    ],
    [
      {'data': 'Pt. Mitra Pinastika', 'date': '23 Juni 2022'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
      {'data': '10'},
    ]
  ];
}
