import 'package:awas_core/res/widgets/kappbar_widget.dart';
import 'package:awas_core/res/widgets/kelevated_button.dart';
import 'package:awas_core/res/widgets/ktext_form_field.dart';

import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

class ReportSettingView extends StatelessWidget {
  static const String routeName = '/report-setting';

  const ReportSettingView({super.key});

  //TODO: Fix bottom spacing

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      appBar: KappBarWidget(title: 'Report Settings', context: context),
      body: SizedBox(
        //expand to device widht
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DataTable(
                dataRowHeight: 100,
                headingRowHeight: 54,
                dataTextStyle: LightColors.whiteTextStyle.copyWith(
                  fontSize: 12,
                ),
                dividerThickness: 0.0,
                columns: [
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Name',
                        style: LightColors.subTitle2TextStyle,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Points',
                        style: LightColors.subTitle2TextStyle,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Active',
                        style: LightColors.subTitle2TextStyle,
                      ),
                    ),
                  ),
                ],
                rows: List.generate(10, (index) {
                  return DataRow(
                    color: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                      // All rows will have the same selected color.
                      if (states.contains(MaterialState.selected)) {
                        return Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.08);
                      }
                      // Even rows will have a grey color.
                      if (index.isEven) {
                        return LightColors.kGreyColor;
                      }
                      return null; // Use default value for other states and odd rows.
                    }),
                    cells: [
                      DataCell(Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Report Target',
                            style: LightColors.black2TextStyle,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Target timeframe',
                            style: LightColors.subTitle2TextStyle.copyWith(
                                fontWeight: FontWeight.normal, fontSize: 12),
                          ),
                        ],
                      )),
                      const DataCell(
                        Center(
                          child: KtextFormFieldWidget(
                            borderSideColor: LightColors.kDarkGreyColor,
                            withEnterText: false,
                            withTitle: false,
                            title: 'yearly',
                          ),
                        ),
                      ),
                      DataCell(Switch(
                        // This bool value toggles the switch.
                        value: true,
                        activeColor: LightColors.kSecondaryColor,
                        onChanged: (bool value) {
                          // This is called when the user toggles the switch.
                        },
                      ))
                    ],
                  );
                }),
              ),
              const SizedBox(
                height: defaultMargin * 8,
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: KelevatedButtonWidget.floating(
        title: 'Save changes',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
