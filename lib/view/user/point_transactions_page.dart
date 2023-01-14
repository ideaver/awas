import '../../res/widgets/point_transaction_list_widget.dart';
import '../../res/widgets/star_circle_widget.dart';
import '/res/theme/colors/light_colors.dart';
import '/res/widgets/kappbar_widget.dart';
import '/res/widgets/kcard_widget.dart';
import 'package:flutter/material.dart';

class PointTransactionsPage extends StatelessWidget {
  const PointTransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kGreyColor,
      appBar: const KappBarWidget(title: 'Points History'),
      body: NestedScrollView(
          physics: const BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                  backgroundColor: LightColors.kGreyColor,
                  expandedHeight: MediaQuery.of(context).size.height / 4,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Padding(
                      padding: const EdgeInsets.all(defaultMargin),
                      child: totalPointsWidget(),
                    ),
                  ))
            ];
          },
          body: const PointTransactionListWidget()),
    );
  }

  KcardWidget totalPointsWidget() {
    return KcardWidget(
        elevation: 10.0,
        color: LightColors.kBackgroundColor,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Total Points',
                style: LightColors.subTitle2TextStyle.copyWith(fontSize: 18),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  const StarCircleWidget(),
                  const SizedBox(
                    width: defaultMargin,
                  ),
                  Text(
                    '1.200',
                    style: LightColors.titleTextStyle,
                  ),
                  const SizedBox(
                    width: defaultMargin / 2,
                  ),
                  Text(
                    'Points',
                    style: LightColors.subTitle2TextStyle,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
