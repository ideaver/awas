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
              'Employee Rank',
              style: LightColors.whiteTextStyle.copyWith(
                  color: textColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            )),
            DataCell(Text(': 19',
                style:
                    LightColors.subTitle2TextStyle.copyWith(color: textColor))),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Crew Rank',
                style: LightColors.whiteTextStyle.copyWith(
                    color: textColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold))),
            DataCell(Text(': 43',
                style:
                    LightColors.subTitle2TextStyle.copyWith(color: textColor))),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Vessel',
                style: LightColors.whiteTextStyle.copyWith(
                    color: textColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold))),
            DataCell(Text(
              ': 27',
              style: LightColors.subTitle2TextStyle.copyWith(color: textColor),
            )),
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('Office',
                style: LightColors.whiteTextStyle.copyWith(
                    color: textColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold))),
            DataCell(Text(': 27',
                style:
                    LightColors.subTitle2TextStyle.copyWith(color: textColor))),
          ],
        ),
      ],
    );
  }
}
