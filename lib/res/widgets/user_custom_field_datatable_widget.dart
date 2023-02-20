import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';

class UserCustomFieldDatatableWidget extends StatelessWidget {
  final Color? textColor;
  const UserCustomFieldDatatableWidget({super.key, this.textColor});
//TODO: coloring table
  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingRowHeight: 0.0,
      dataTextStyle: LightColors.whiteTextStyle.copyWith(fontSize: 12),
      dividerThickness: 0.0,
      columnSpacing: defaultMargin,
      dataRowHeight: defaultMargin,
      columns: const [
        DataColumn(
          label: SizedBox(),
        ),
        DataColumn(
          label: SizedBox(),
        ),
      ],
      rows: [
        DataRow(
          cells: [
            DataCell(Text(
              'Employee/Crew',
              style: LightColors.whiteTextStyle.copyWith(
                  color: textColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            )),
            DataCell(Text(': 19',
                style: LightColors.whiteTextStyle
                    .copyWith(color: textColor, fontSize: 12))),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Rank',
                style: LightColors.whiteTextStyle.copyWith(
                    color: textColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold))),
            DataCell(Text(': 43',
                style: LightColors.whiteTextStyle
                    .copyWith(color: textColor, fontSize: 12))),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Dept/Vessel',
                style: LightColors.whiteTextStyle.copyWith(
                    color: textColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold))),
            DataCell(Text(
              ': 27',
              style: LightColors.whiteTextStyle
                  .copyWith(color: textColor, fontSize: 12),
            )),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Company',
                style: LightColors.whiteTextStyle.copyWith(
                    color: textColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold))),
            DataCell(Text(': 27',
                style: LightColors.whiteTextStyle
                    .copyWith(color: textColor, fontSize: 12))),
          ],
        ),
      ],
    );
  }
}
