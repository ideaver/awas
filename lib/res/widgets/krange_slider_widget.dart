import '/res/theme/colors/light_colors.dart';
import '/res/widgets/ktext_form_field.dart';
import 'package:flutter/material.dart';

class KrangeSliderWidget extends StatefulWidget {
  const KrangeSliderWidget({super.key});

  @override
  State<KrangeSliderWidget> createState() => _KrangeSliderWidgetState();
}

class _KrangeSliderWidgetState extends State<KrangeSliderWidget> {
  double start = 30.0;
  double end = 590.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RangeSlider(
          activeColor: LightColors.kSecondaryColor,
          values: RangeValues(start, end),
          labels: RangeLabels(start.toString(), end.toString()),
          onChanged: (value) {
            setState(() {
              start = value.start;
              end = value.end;
            });
          },
          min: 0.0,
          max: 2000.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Expanded(
                flex: 2,
                child: KtextFormFieldWidget(withTitle: false, title: 'from')),
            Spacer(
              flex: 1,
            ),
            Expanded(
                flex: 2,
                child: KtextFormFieldWidget(withTitle: false, title: 'to'))
          ],
        )
      ],
    );
  }
}
