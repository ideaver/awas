import 'package:awas_core/res/widgets/kappbar_widget.dart';

import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

class ObservationChecklistSettingView extends StatelessWidget {
  static const String routeName = '/observation-checklist-setting';

  const ObservationChecklistSettingView({super.key});

  //TODO: Fix bottom spacing

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      appBar: KappBarWidget(
        title: 'Card > Rekasi Orang',
        context: context,
      ),
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
