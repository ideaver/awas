import 'package:flutter/cupertino.dart';

import '../theme/colors/light_colors.dart';
import 'kdropdown_widget.dart';

class CompanyCustomFieldWidget extends StatelessWidget {
  const CompanyCustomFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        KdropdownWidget(title: 'Crew Rank'),
        SizedBox(height: defaultMargin),
        KdropdownWidget(title: 'Employee Rank'),
        SizedBox(height: defaultMargin),
        KdropdownWidget(title: 'Vessel'),
        SizedBox(height: defaultMargin),
        KdropdownWidget(title: 'Office'),
      ],
    );
  }
}
