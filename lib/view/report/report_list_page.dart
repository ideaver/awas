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

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KappBarWidget(
        context: context,
        title: 'Report List',
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: LightColors.kPrimaryColor,
              )),
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/report-filter');
              },
              icon: const Icon(
                Icons.filter_alt,
                color: LightColors.kPrimaryColor,
              ))
        ],
        bottom: KtabBarWidget(
            titles: const ['All', 'Posivite', 'Negative'],
            controller: tabController),
      ),
      body: ReportListWidget(context: context),
    );
  }
}
