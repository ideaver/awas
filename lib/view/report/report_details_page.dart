import '../../res/widgets/status_chip_widget.dart';
import '/res/theme/colors/light_colors.dart';
import '/res/widgets/kappbar_widget.dart';
import '/res/widgets/ktabbar_widget.dart';
import 'package:flutter/material.dart';

class ReportDetailsPage extends StatefulWidget {
  const ReportDetailsPage({super.key});

  @override
  State<ReportDetailsPage> createState() => _ReportDetailsPageState();
}

class _ReportDetailsPageState extends State<ReportDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      appBar: KappBarWidget(
        //TODO: Change to sliver background flexible one image
        centerTitle: true,
        title: 'Report',
        subTitle: '  ID663298450',
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: LightColors.kDarkGreyColor,
              ))
        ],
        bottom: KtabBarWidget(
            controller: tabController,
            titles: const ['Overview', 'Detail', 'Comments (20)']),
      ),
      body: ListView(
        padding: const EdgeInsets.all(defaultMargin),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const statusChipWidget(),
              Text(
                'Duration: 70 min',
                style: LightColors.subTitle2TextStyle,
              )
            ],
          ),
          const SizedBox(height: defaultMargin),
          Text(
            'Resiko Menumpahkan Masakan Panas',
            style: LightColors.blackTextStyle
                .copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
