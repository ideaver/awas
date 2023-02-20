import '../../../res/widgets/ktext_form_field.dart';
import '/res/theme/colors/light_colors.dart';
import '/res/widgets/kappbar_widget.dart';
import 'package:flutter/material.dart';

import 'observation_add_edit_page.dart';
import 'observation_event_details_page.dart';

class PointSettingPageModel {
  final String title;
  final String? description;
  final Widget form;
  final Switch switchButton;

  PointSettingPageModel(
      {required this.title,
      this.description,
      required this.form,
      required this.switchButton});
}

class ObservationEventSettingPage extends StatelessWidget {
  static const String routeName = '/observation-event-setting';

  const ObservationEventSettingPage({super.key});

  //TODO: Fix bottom spacing

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      appBar:
          KappBarWidget(title: 'Observation Event Settings', context: context),
      body: SizedBox(
        //expand to device widht
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              DataTable(
                dataRowHeight: 80,
                headingRowHeight: 100.0,
                dataTextStyle:
                    LightColors.whiteTextStyle.copyWith(fontSize: 12),
                dividerThickness: 0.0,
                columns: [
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'name'.toUpperCase(),
                        style: LightColors.subTitle2TextStyle,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'details'.toUpperCase(),
                        style: LightColors.subTitle2TextStyle,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        '% Weight'.toUpperCase(),
                        style: LightColors.subTitle2TextStyle,
                      ),
                    ),
                  ),
                ],
                rows: List.generate(10, (index) {
                  return DataRow(
                    onSelectChanged: (value) {
                      Navigator.pushNamed(
                          context, ObservationEventDetailsPage.routeName);
                    },
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
                      DataCell(Text(
                        'Reaksi Orang',
                        style:
                            LightColors.black2TextStyle.copyWith(fontSize: 12),
                      )),
                      DataCell(Center(
                          child: Text(
                        '5',
                        style: LightColors.black2TextStyle,
                      ))),
                      const DataCell(Center(
                          child: KtextFormFieldWidget(
                              borderSideColor: LightColors.kDarkGreyColor,
                              withEnterText: false,
                              withTitle: false,
                              title: '20%')))
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
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(defaultMargin),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(
                context, ObservationEventPage.createModeRouteName);
          },
          child: const Icon(
            Icons.add,
            color: LightColors.kWhiteColor,
          ),
        ),
      ),
    );
  }
}
