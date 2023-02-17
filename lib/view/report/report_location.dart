import 'package:awas/res/widgets/kappbar_widget.dart';
import 'package:flutter/material.dart';

import '../../res/utils/enums.dart';
import '../../res/widgets/kanimated_list_widget.dart';

class ReportLocationPage extends StatelessWidget {
  final PageState userPageState;
  static const String pickerRouteName = '/report-location-picker';
  static const String viewRouteName = '/report-location-view';

  const ReportLocationPage({super.key, required this.userPageState});

  const ReportLocationPage.picker() : this(userPageState: PageState.edit);
  const ReportLocationPage.view() : this(userPageState: PageState.view);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KappBarWidget(
          context: context,
          title: userPageState == PageState.edit ? 'Choose Location' : ' '),
      body: SingleChildScrollView(child: KanimatedListExpansionWidget()),
    );
  }
}
