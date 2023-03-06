import 'package:awas_core/res/utils/enums.dart';
import 'package:awas_core/res/widgets/kappbar_widget.dart';
import 'package:awas_core/res/widgets/kcard_widget.dart';
import 'package:awas_core/res/widgets/point_transaction_list_widget.dart';
import 'package:awas_core/res/widgets/star_circle_widget.dart';
import 'package:flutter/services.dart';

import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

class PointTransactionsView extends StatelessWidget {
  final PageStateEnum pointTransactionsPageState;

  static const String routeName = '/point-transactions';
  static const String viewAsMeRouteName = '/my-point-transactions';

  const PointTransactionsView({
    super.key,
    required this.pointTransactionsPageState,
  });

  const PointTransactionsView.viewAsMe({
    super.key,
    this.pointTransactionsPageState = PageStateEnum.viewAsMe,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kGreyColor,
      appBar: KappBarWidget(
        context: context,
        title: pointTransactionsPageState == PageStateEnum.viewAsMe
            ? 'My Points History'
            : 'Budi Point History',
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: LightColors.kBackgroundColor,
        ),
      ),
      body: pointTransactionsPageState == PageStateEnum.viewAsMe
          ? NestedScrollView(
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
                    ),
                  )
                ];
              },
              body: const PointTransactionListWidget(),
            )
          : const PointTransactionListWidget(
              physics: BouncingScrollPhysics(),
            ),
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
      ),
    );
  }
}
