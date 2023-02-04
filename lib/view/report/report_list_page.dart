import 'package:awas/res/utils/globals.dart';
import 'package:awas/view/report/report_filter_page.dart';
import 'package:awas/view/user/user_filter_page.dart';

import '../../res/widgets/animation_search_bar_widget.dart';
import '../../res/widgets/report_list_widget.dart';
import '/res/theme/colors/light_colors.dart';
import '/res/widgets/kappbar_widget.dart';
import '/res/widgets/ktabbar_widget.dart';
import 'package:flutter/material.dart';

class ReportListPage extends StatefulWidget {
  static const String routeName = '/report-list';

  const ReportListPage({super.key});

  @override
  State<ReportListPage> createState() => _ReportListPageState();
}

class _ReportListPageState extends State<ReportListPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 52),
          child: SafeArea(
              child: Container(
            decoration: const BoxDecoration(
              color: LightColors.kBackgroundColor,

              //  boxShadow: [
              //   BoxShadow(
              //       color: Colors.grey,
              //       blurRadius: 1,
              //       spreadRadius: 0,
              //       offset: Offset(0, 1))
              // ]
            ),
            alignment: Alignment.center,
            child: AnimationSearchBarWidget(
              textStyle: LightColors.titleTextStyle.copyWith(
                fontSize: 18.0,
              ),
              closeIconColor: LightColors.kDarkGreyColor,
              hintStyle: LightColors.subTitle2TextStyle,
              backIconColor: LightColors.kDarkGreyColor,
              centerTitle: 'Report List',
              onChanged: (text) {
                // countries = _countries
                //     .where(
                //         (e) => e.toLowerCase().contains(text.toLowerCase()))
                //     .toList();
                // setState(() {});
              },
              searchTextEditingController: controller,
              horizontalPadding: defaultMargin / 2,
              trailling: IconButton(
                  icon: const Icon(Icons.filter_alt_outlined,
                      size: 35, color: LightColors.kDarkGreyColor),
                  onPressed: () {
                    Navigator.pushNamed(context, ReportFilterPage.routeName);
                  }),
            ),
          ))),

      // KappBarWidget(
      //   context: context,
      //   title: 'Report List',
      //   actions: [
      //     IconButton(
      //         onPressed: () {},
      //         icon: const Icon(
      //           Icons.search,
      //           color: LightColors.kPrimaryColor,
      //         )),
      //     IconButton(
      //         onPressed: () {
      //           Navigator.pushNamed(context, '/report-filter');
      //         },
      //         icon: const Icon(
      //           Icons.filter_alt,
      //           color: LightColors.kPrimaryColor,
      //         ))
      //   ],
      //   bottom: KtabBarWidget(
      //       titles: const ['All', 'Posivite', 'Negative'],
      //       controller: tabController),
      // ),
      body: ReportListWidget(context: context),
    );
  }
}
