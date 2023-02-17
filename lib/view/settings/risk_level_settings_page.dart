import 'package:awas/res/theme/colors/light_colors.dart';
import 'package:awas/res/widgets/kappbar_widget.dart';
import 'package:awas/res/widgets/kelevated_button.dart';
import 'package:flutter/material.dart';

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

  double _discreteValue = 10;
  double _discreteValue2 = 50;
  double _discreteValue3 = 100;

  Widget body() {
    return Container(
      child: Stack(
        children: [
          Slider(
            value: _discreteValue,
            min: 0.0,
            max: _discreteValue2,
            divisions: 5,
            label: '${_discreteValue.round()}',
            onChanged: (double value) {
              setState(() {
                _discreteValue = value;
              });
            },
          ),
          Slider(
            value: _discreteValue2,
            min: _discreteValue,
            max: _discreteValue3,
            divisions: 5,
            label: '${_discreteValue2.round()}',
            onChanged: (double value) {
              setState(() {
                _discreteValue2 = value;
              });
            },
          ),
          Slider(
            value: _discreteValue3,
            min: _discreteValue2,
            max: 100.0,
            divisions: 5,
            label: '${_discreteValue3.round()}',
            onChanged: (double value) {
              setState(() {
                _discreteValue3 = value;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget saveButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
      child: KelevatedButtonWidget(
        onPressed: () {
          // TODO
        },
        title: 'Save Changes',
      ),
    );
  }
}
