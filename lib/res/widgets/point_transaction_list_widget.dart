import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';
import 'star_circle_widget.dart';

class PointTransactionListWidget extends StatelessWidget {
  const PointTransactionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: fix space in profile page
    return Scaffold(
      backgroundColor: LightColors.kGreyColor,
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 20,
        itemBuilder: (context, index) {
          if (index == 0) {
            return titleSeparatorWidget(title: 'recently');
          } else if (index == 5) {
            return titleSeparatorWidget(title: 'older');
          }
          return Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Material(
              //TODO: Change to list separated
              child: ListTile(
                onTap: () {},
                tileColor: LightColors.kBackgroundColor,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: defaultMargin / 3, horizontal: defaultMargin),
                leading: index.isOdd
                    ? const StarCircleWidget(
                        height: 15, color: LightColors.kDangerColor)
                    : const StarCircleWidget(height: 15),
                title: Text(
                  'Near Miss Report',
                  style: LightColors.blackTextStyle
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  '$index Desember 2022',
                  style: LightColors.subTitle2TextStyle,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '+$index',
                      style: LightColors.blackTextStyle
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.star_rounded,
                      color: LightColors.kTertiaryColor,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Padding titleSeparatorWidget({required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultMargin, vertical: defaultMargin / 2),
      child: Text(
        title.toUpperCase(),
        style: LightColors.subTitle2TextStyle,
      ),
    );
  }
}
