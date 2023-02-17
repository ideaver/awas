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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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

  RangeLabels labels = const RangeLabels('1', "100");
  RangeValues values = const RangeValues(1, 100);
  RangeLabels labels2 = const RangeLabels('1', "100");
  RangeValues values2 = const RangeValues(1, 100);

  Widget body() {
    return const MultipleRangeSlider();
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
