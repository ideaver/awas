import 'dart:convert';

import '/res/widgets/kelevated_button.dart';
import '/res/widgets/ktext_form_field.dart';

import '/res/theme/colors/light_colors.dart';
import '/res/widgets/kappbar_widget.dart';
import 'package:flutter/material.dart';

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

class ObservationChecklistSettingPage extends StatelessWidget {
  static const String routeName = '/observation-checklist-setting';

  const ObservationChecklistSettingPage({super.key});

  //TODO: Fix bottom spacing

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      appBar: KappBarWidget(title: 'Card > Rekasi Orang', context: context),
      body: SizedBox(
        //expand to device widht
        width: double.infinity,
        child: SingleChildScrollView(
          child: DataTable(
            dataRowHeight: 80,
            headingRowHeight: 100.0,
            dataTextStyle: LightColors.whiteTextStyle.copyWith(fontSize: 12),
            dividerThickness: 0.0,
            columns: [
              DataColumn(
                label: Expanded(
                  child: Text(
                    'checklist'.toUpperCase(),
                    style: LightColors.subTitle2TextStyle,
                  ),
                ),
              ),
              DataColumn(
                label: Expanded(
                  child: Text(
                    'delete'.toUpperCase(),
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
                  DataCell(Text(
                    'Merencanakan Ulang Pekerjaan',
                    style: LightColors.black2TextStyle,
                  )),
                  DataCell(IconButton(
                      onPressed: () {},
                      splashColor: LightColors.kDangerColor,
                      icon: const Icon(
                        Icons.delete,
                        color: LightColors.kPrimaryColor,
                      )))
                ],
              );
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: LightColors.kWhiteColor,
        ),
      ),
    );
  }
}
