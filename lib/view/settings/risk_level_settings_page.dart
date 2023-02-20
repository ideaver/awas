import 'package:awas/res/theme/colors/light_colors.dart';
import 'package:awas/res/widgets/kappbar_widget.dart';
import 'package:awas/res/widgets/kelevated_button.dart';
import 'package:flutter/material.dart';

import '../../res/widgets/multiple_range_slider.dart';

class RiskLevelSettingsPage extends StatefulWidget {
  const RiskLevelSettingsPage({Key? key}) : super(key: key);

  static const String routeName = '/risk-level-settings';

  @override
  State<RiskLevelSettingsPage> createState() => _RiskLevelSettingsPageState();
}

class _RiskLevelSettingsPageState extends State<RiskLevelSettingsPage> {
  TextEditingController maxValueController = TextEditingController(text: '400');
  TextEditingController minValueController = TextEditingController(text: '0');

  List<RangeModel> sliderData = [
    RangeModel(
      name: 'Escalation Risk',
      color: Colors.red,
      minValue: 300,
      maxValue: 400,
    ),
    RangeModel(
      name: 'High Risk',
      color: Colors.blue,
      minValue: 200,
      maxValue: 300,
    ),
    RangeModel(
      name: 'Medium Risk',
      color: Colors.amber,
      minValue: 100,
      maxValue: 200,
    ),
    RangeModel(
      name: 'Low Risk',
      color: Colors.green,
      minValue: 0,
      maxValue: 100,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: body(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: saveButton(),
    );
  }

  KappBarWidget appBar(BuildContext context) {
    return KappBarWidget(
      context: context,
      centerTitle: false,
      title: 'Risk Level Settings Parameter',
    );
  }

  Widget body() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding:
          const EdgeInsets.only(top: defaultMargin, bottom: defaultMargin * 3),
      child: MultipleRangeSlider(
        ranges: sliderData,
        maxValueController: maxValueController,
        minValueController: minValueController,
        sliderHeight: 400,
      ),
    );
  }

  Widget saveButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
      child: KelevatedButtonWidget(
        onPressed: () {
          // TODO;
          Navigator.pop(context);
        },
        title: 'Save Changes',
      ),
    );
  }
}
