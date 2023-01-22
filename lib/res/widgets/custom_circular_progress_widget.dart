import 'dart:math';

import 'package:awas/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

import 'kcard_widget.dart';

class CustomCircularProgressWidget extends StatefulWidget {
  const CustomCircularProgressWidget({super.key});

  @override
  _CustomCircularProgressWidgetState createState() =>
      _CustomCircularProgressWidgetState();
}

class _CustomCircularProgressWidgetState
    extends State<CustomCircularProgressWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;
  double _fraction = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {
          _fraction = _animation.value;
        });
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    const maxValue = 1700;
    const current = 1234.5;

    return KcardWidget(
      elevation: 0.0,
      padding: const EdgeInsets.all(defaultMargin / 2),
      color: LightColors.kBackgroundColor,
      borderColor: LightColors.kLavender,
      child: Column(
        children: [
          Text(
            'Safety Awareness Index',
            style: LightColors.black2TextStyle.copyWith(fontSize: 12),
            textAlign: TextAlign.center,
          ),
          Stack(alignment: AlignmentDirectional.center, children: [
            Text(
              '${(100 * current / maxValue).toStringAsFixed(0)}%',
              style: LightColors.subTitleTextStyle,
            ),
            CustomPaint(
              foregroundPainter:
                  _MyCustomRadialGaugePainter(_fraction, maxValue, current),
              child: Container(
                padding: EdgeInsets.only(top: screenHeight * 0.0875),
                width: 50,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        height: screenHeight * 0.04,
                        color: Colors.transparent,
                      ),

                      Container(
                        height: screenHeight * 0.04,
                        color: Colors.transparent,
                      ),
                      // Container(
                      //     height: screenHeight * 0.04,
                      //     child: Text('Title', style: LightColors.subTitle2TextStyle))
                    ],
                  ),
                ),
              ),
            ),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'This month',
                    style:
                        LightColors.subTitle2TextStyle.copyWith(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '73%',
                    style: LightColors.blackTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Last month',
                    style:
                        LightColors.subTitle2TextStyle.copyWith(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '63%',
                    style: LightColors.blackTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MyCustomRadialGaugePainter extends CustomPainter {
  final num maxValue;
  final num current;

  double _fraction;

  _MyCustomRadialGaugePainter(this._fraction, this.maxValue, this.current);

  @override
  void paint(Canvas canvas, Size size) {
    final complete = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13.0;

    final line = Paint()
      ..color = const Color(0xFFE9E9E9)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height);

    const startAngle = -7 * pi / 6;
    const sweepAngle = 4 * pi / 3;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle,
        sweepAngle, false, line);

    final arcAngle = (sweepAngle) * (current / maxValue);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startAngle,
        arcAngle * _fraction, false, complete);

    final lowerBoundText = TextPainter(textDirection: TextDirection.ltr)
      ..text = TextSpan(text: '0', style: LightColors.subTitle2TextStyle)
      ..layout(minWidth: 0, maxWidth: double.maxFinite);
    lowerBoundText.paint(
        canvas, Offset(-size.width * 0.42, size.height / 1.22));

    final upperBoundText = TextPainter(textDirection: TextDirection.ltr)
      ..text =
          TextSpan(text: '$maxValue', style: LightColors.subTitle2TextStyle)
      ..layout(minWidth: 0, maxWidth: double.maxFinite);
    upperBoundText.paint(canvas, Offset(size.width / 0.77, size.height / 1.22));
  }

  @override
  bool shouldRepaint(_MyCustomRadialGaugePainter oldDelegate) =>
      oldDelegate._fraction != _fraction;
}
