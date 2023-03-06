import 'package:awas_core/res/utils/enums.dart';
import 'package:awas_core/res/widgets/kanimated_list_widget.dart';
import 'package:awas_core/res/widgets/kappbar_widget.dart';
import 'package:flutter/material.dart';

class ReportLocationView extends StatelessWidget {
  final PageStateEnum userPageState;

  static const String pickerRouteName = '/report-location-picker';
  static const String viewRouteName = '/report-location-view';

  const ReportLocationView({super.key, required this.userPageState});

  const ReportLocationView.picker({
    super.key,
    this.userPageState = PageStateEnum.edit,
  });

  const ReportLocationView.view({
    super.key,
    this.userPageState = PageStateEnum.view,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KappBarWidget(
        context: context,
        title: userPageState == PageStateEnum.edit ? 'Choose Location' : ' ',
      ),
      body: const SingleChildScrollView(
        child: KanimatedListExpansionWidget(),
      ),
    );
  }
}
