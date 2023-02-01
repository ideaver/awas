import 'package:awas/res/theme/colors/light_colors.dart';
import 'package:awas/res/widgets/kcard_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key});

  @override
  State<StatefulWidget> createState() => PieChartWidgetState();
}

class PieChartWidgetState extends State {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return KcardWidget(
      elevation: 0,
      padding: const EdgeInsets.all(defaultMargin),
      color: LightColors.kBackgroundColor,
      borderColor: LightColors.kLavender,
      child: Column(
        children: [
          Text(
            'Frequent Events',
            style: LightColors.black2TextStyle.copyWith(fontSize: 12),
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: defaultMargin,
          ),
          SizedBox(
            height: 187,
            child: PieChart(
              PieChartData(
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    setState(() {
                      if (!event.isInterestedForInteractions ||
                          pieTouchResponse == null ||
                          pieTouchResponse.touchedSection == null) {
                        touchedIndex = -1;
                        return;
                      }
                      touchedIndex =
                          pieTouchResponse.touchedSection!.touchedSectionIndex;
                    });
                  },
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                sections: showingSections(),
              ),
            ),
          ),
          const SizedBox(
            width: defaultMargin,
          ),
          labelWidget(),
          labelWidget(),
          labelWidget(),
          labelWidget(),
        ],
      ),
    );
  }

  Widget labelWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.sentiment_dissatisfied,
          color: LightColors.kPrimaryColor,
        ),
        const SizedBox(
          width: defaultMargin / 2,
        ),
        Expanded(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: LightColors.subTitle2TextStyle,
              children: const [
                TextSpan(
                    text: '134', style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: ' Terjatuh dari ketinggian', style: TextStyle()),
              ],
            ),
          ),
        )
      ],
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 14.0 : 11.0;
      final radius = isTouched ? 70.0 : 65.0;
      final widgetSize = isTouched ? 50.0 : 40.0;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: LightColors.kPrimaryColor.withOpacity(0.5),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
            badgeWidget: Badge(
              icon: const Icon(
                Icons.sentiment_very_dissatisfied,
                color: LightColors.kDangerColor,
              ),
              size: widgetSize,
              borderColor: const Color(0xff0293ee),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: LightColors.kTertiaryColor,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
            badgeWidget: Badge(
              icon: const Icon(
                Icons.sentiment_very_dissatisfied,
                color: LightColors.kDangerColor,
              ),
              size: widgetSize,
              borderColor: const Color(0xfff8b250),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: LightColors.kSecondaryColor,
            value: 16,
            title: '16%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
            badgeWidget: Badge(
              icon: const Icon(
                Icons.sentiment_very_dissatisfied,
                color: LightColors.kDangerColor,
              ),
              size: widgetSize,
              borderColor: const Color(0xff845bef),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: LightColors.kPrimaryColor,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
            badgeWidget: Badge(
              icon: const Icon(
                Icons.sentiment_very_dissatisfied,
                color: LightColors.kDangerColor,
              ),
              size: widgetSize,
              borderColor: const Color(0xff13d38e),
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          throw Exception('Oh no');
      }
    });
  }
}

class Badge extends StatelessWidget {
  const Badge({
    required this.icon,
    required this.size,
    required this.borderColor,
  });
  final Icon icon;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: icon,
      ),
    );
  }
}
