import '/res/theme/colors/light_colors.dart';
import '/res/widgets/kappbar_widget.dart';
import '/res/widgets/ktabbar_widget.dart';
import 'package:flutter/material.dart';

class ReportListPage extends StatefulWidget {
  ReportListPage({super.key});

  @override
  State<ReportListPage> createState() => _ReportListPageState();
}

class _ReportListPageState extends State<ReportListPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kGreyColor,
      appBar: KappBarWidget(
        title: 'Report List',
        bottom: KtabBarWidget(
            titles: ['All', 'Posivite', 'Negative'], controller: tabController),
      ),
    );
  }
}
