import '/res/theme/colors/light_colors.dart';
import '/res/widgets/kappbar_widget.dart';
import '/res/widgets/ktabbar_widget.dart';
import 'package:flutter/material.dart';

import 'package:dotted_border/dotted_border.dart';

class ReportFormPage extends StatefulWidget {
  const ReportFormPage({super.key});

  @override
  State<ReportFormPage> createState() => _ReportFormPageState();
}

class _ReportFormPageState extends State<ReportFormPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTextStyle =
        LightColors.black2TextStyle.copyWith(fontWeight: FontWeight.bold);
    //TODO: Change to sliver appbar
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      appBar: KappBarWidget(
        title: 'Report',
        subTitle: 'ID45345783',
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Clear',
                style: LightColors.subTitle2TextStyle,
              ))
        ],
        bottom: KtabBarWidget(
            controller: tabController,
            titles: const ['Observation', 'Action'],
            labelIcon: const Icon(
              Icons.chevron_right,
              color: LightColors.kPrimaryColor,
            )),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(defaultMargin),
        children: [
          Row(
            children: [
              Text(
                'Upload Images',
                style: titleTextStyle,
              ),
              const SizedBox(
                width: defaultMargin / 4,
              ),
              Text(
                '(max 4)',
                style: LightColors.subTitle3TextStyle,
              ),
            ],
          ),
          const SizedBox(height: defaultMargin),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 80,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(defaultCircular),
                  padding: EdgeInsets.all(5),
                  dashPattern: const [3, 3, 3, 3],
                  color: LightColors.kDarkGreyColor,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    child: Container(
                      height: 80,
                      width: 80,
                      color: LightColors.kGreyColor,
                      child: Icon(Icons.add),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
