import 'package:awas/res/widgets/ktext_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../theme/colors/light_colors.dart';

class RangeModel {
  final String name;
  double minValue;
  double maxValue;
  final Color color;

  RangeModel({
    required this.name,
    required this.minValue,
    required this.maxValue,
    required this.color,
  });
}

class MultipleRangeSlider extends StatefulWidget {
  // TODO
  // final RangeModel data;

  final List<RangeModel> ranges;
  final TextEditingController maxValueController;
  final TextEditingController minValueController;
  final double toggleSize;
  final int sliderHeight;
  final double lineWidth;
  final double toggleBorderWidth;

  const MultipleRangeSlider({
    Key? key,
    required this.ranges,
    required this.maxValueController,
    required this.minValueController,
    this.toggleSize = 24,
    this.sliderHeight = 300,
    this.lineWidth = 4,
    this.toggleBorderWidth = 2,
  }) : super(key: key);

  @override
  State<MultipleRangeSlider> createState() => _MultipleRangeSliderState();
}

class _MultipleRangeSliderState extends State<MultipleRangeSlider> {
  // double red = 300;
  // double yellow = 200;
  // double green = 100;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          background(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              indicator(),
              const SizedBox(width: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 80,
                    // height: 28,
                    child: KtextFormFieldWidget(
                      controller: widget.maxValueController,
                      onChanged: (text) {
                        if (text.isNotEmpty) {
                          widget.ranges.first.maxValue = double.tryParse(text)!;
                          setState(() {});
                        }
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      hintText: 'Max.',
                      withTitle: false,
                      textAlign: TextAlign.center,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      fieldMargin: const EdgeInsets.symmetric(
                        vertical: 4,
                      ),
                      style: LightColors.titleTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Container(
                    width: widget.toggleSize,
                    height: widget.ranges.first.maxValue.toDouble(),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Stack(
                      children: [
                        ranges(),
                        toggles(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 80,
                    // height: 28,
                    child: KtextFormFieldWidget(
                      controller: widget.minValueController,
                      onChanged: (text) {
                        if (text.isNotEmpty) {
                          widget.ranges.last.maxValue = double.tryParse(text)!;
                          setState(() {});
                        }
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      hintText: 'Min.',
                      withTitle: false,
                      textAlign: TextAlign.center,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      fieldMargin: const EdgeInsets.symmetric(
                        vertical: 4,
                      ),
                      style: LightColors.titleTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: widget.toggleSize * 3),
            ],
          ),
        ],
      ),
    );
  }

  Widget toggles() {
    return Stack(
      children: [
        ...List.generate(widget.ranges.length - 1, (i) {
          return toggleWidget(i);
        }),
        // Positioned(
        //   bottom: red,
        //   child: GestureDetector(
        //     onPanUpdate: (details) {
        //       setState(() {
        //         if (red <= (widget.sliderHeight - widget.toggleSize) &&
        //             red >= (yellow + widget.toggleSize)) {
        //           red -= details.delta.dy;
        //         } else if (red < (yellow + widget.toggleSize)) {
        //           red = yellow + widget.toggleSize;
        //         } else if (red > (widget.sliderHeight - widget.toggleSize)) {
        //           red = (widget.sliderHeight - widget.toggleSize);
        //         }
        //       });
        //     },
        //     child: Container(
        //       width: widget.toggleSize,
        //       height: widget.toggleSize,
        //       decoration: BoxDecoration(
        //         color: Colors.white,
        //         shape: BoxShape.circle,
        //         border: Border.all(
        //           width: widget.toggleBorderWidth,
        //           color: Colors.blue,
        //         ),
        //         boxShadow: const [
        //           BoxShadow(
        //             color: Colors.black26,
        //             blurRadius: 2,
        //             offset: Offset(1, 1),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        // Positioned(
        //   bottom: yellow,
        //   child: GestureDetector(
        //     onPanUpdate: (details) {
        //       setState(() {
        //         if (yellow <= (red - widget.toggleSize) &&
        //             yellow >= (green + widget.toggleSize)) {
        //           yellow -= details.delta.dy;
        //         } else if (yellow < (green + widget.toggleSize)) {
        //           yellow = green + widget.toggleSize;
        //         } else if (yellow > (red - widget.toggleSize)) {
        //           yellow = red - widget.toggleSize;
        //         }
        //       });
        //     },
        //     child: Container(
        //       width: widget.toggleSize,
        //       height: widget.toggleSize,
        //       decoration: BoxDecoration(
        //         color: Colors.white,
        //         shape: BoxShape.circle,
        //         border: Border.all(
        //           width: widget.toggleBorderWidth,
        //           color: Colors.amber,
        //         ),
        //         boxShadow: const [
        //           BoxShadow(
        //             color: Colors.black26,
        //             blurRadius: 2,
        //             offset: Offset(1, 1),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        // Positioned(
        //   bottom: green,
        //   child: GestureDetector(
        //     onPanUpdate: (details) {
        //       setState(() {
        //         if (green <= (yellow - widget.toggleSize) && green >= 0) {
        //           green -= details.delta.dy;
        //         } else if (green < 0) {
        //           green = 0;
        //         } else if (green > (yellow - widget.toggleSize)) {
        //           green = yellow - widget.toggleSize;
        //         }
        //       });
        //     },
        //     child: Container(
        //       width: widget.toggleSize,
        //       height: widget.toggleSize,
        //       decoration: BoxDecoration(
        //         color: Colors.white,
        //         shape: BoxShape.circle,
        //         border: Border.all(
        //           width: widget.toggleBorderWidth,
        //           color: Colors.green,
        //         ),
        //         boxShadow: const [
        //           BoxShadow(
        //             color: Colors.black26,
        //             blurRadius: 2,
        //             offset: Offset(1, 1),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget toggleWidget(int i) {
    return Positioned(
      bottom: widget.ranges[i].minValue,
      child: GestureDetector(
        onPanUpdate: (details) {
          // TODO CALCULATE VALUE BY SLIDER HEIGHT
          if (i == 0) {
            // First toggle
            if (widget.ranges[i].minValue <=
                    (widget.sliderHeight - widget.toggleSize) &&
                widget.ranges[i].minValue >=
                    (widget.ranges[i + 1].minValue + widget.toggleSize)) {
              setState(() {
                widget.ranges[i].minValue -= details.delta.dy;
              });
            } else if (widget.ranges[i].minValue <
                (widget.ranges[i + 1].minValue + widget.toggleSize)) {
              setState(() {
                widget.ranges[i].minValue =
                    widget.ranges[i + 1].minValue + widget.toggleSize;
              });
            } else if (widget.ranges[i].minValue >
                (widget.sliderHeight - widget.toggleSize)) {
              setState(() {
                widget.ranges[i].minValue =
                    (widget.sliderHeight - widget.toggleSize);
              });
            }
          } else if (i == widget.ranges.length - 1) {
            // Last toggle
            if (widget.ranges[i].minValue <=
                    (widget.ranges[i - 1].minValue - widget.toggleSize) &&
                widget.ranges[i].minValue >= 0) {
              setState(() {
                widget.ranges[i].minValue -= details.delta.dy;
              });
            } else if (widget.ranges[i].minValue < 0) {
              widget.ranges[i].minValue = 0;
            } else if (widget.ranges[i].minValue >
                (widget.ranges[i - 1].minValue - widget.toggleSize)) {
              setState(() {
                widget.ranges[i].minValue =
                    widget.ranges[i - 1].minValue - widget.toggleSize;
              });
            }
          } else {
            // Other  toggles
            if (widget.ranges[i].minValue <=
                    (widget.ranges[i - 1].minValue - widget.toggleSize) &&
                widget.ranges[i].minValue >=
                    (widget.ranges[i + 1].minValue + widget.toggleSize)) {
              setState(() {
                widget.ranges[i].minValue -= details.delta.dy;
              });
            } else if (widget.ranges[i].minValue <
                (widget.ranges[i + 1].minValue + widget.toggleSize)) {
              setState(() {
                widget.ranges[i].minValue =
                    widget.ranges[i + 1].minValue + widget.toggleSize;
              });
            } else if (widget.ranges[i].minValue >
                (widget.ranges[i - 1].minValue - widget.toggleSize)) {
              setState(() {
                widget.ranges[i].minValue =
                    widget.ranges[i - 1].minValue - widget.toggleSize;
              });
            }
          }
        },
        child: Container(
          width: widget.toggleSize,
          height: widget.toggleSize,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              width: widget.toggleBorderWidth,
              color: widget.ranges[i + 1].color,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 2,
                offset: Offset(1, 1),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget indicator() {
    return SizedBox(
      width: 54,
      height: widget.sliderHeight.toDouble(),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          ...List.generate(
            widget.ranges.length - 1,
            (i) {
              return Positioned(
                bottom: widget.ranges[i].minValue + (widget.toggleSize / 5),
                child: Text(
                  '${(i == 0 ? widget.ranges[i].minValue : widget.ranges[i].maxValue).truncate()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
          // Positioned(
          //   bottom: red + (widget.toggleSize / 5),
          //   child: Text(
          //     '${red.truncate()}',
          //     style: const TextStyle(
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          // Positioned(
          //   bottom: yellow + (widget.toggleSize / 5),
          //   child: Text(
          //     '${yellow.truncate()}',
          //     style: const TextStyle(
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
          // Positioned(
          //   bottom: green + (widget.toggleSize / 5),
          //   child: Text(
          //     '${green.truncate()}',
          //     style: const TextStyle(
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget ranges() {
    return Stack(
      alignment: Alignment.center,
      children: [
        ...List.generate(
          widget.ranges.length,
          (i) {
            return Positioned(
              top: i == 0
                  ? 0
                  : widget.sliderHeight -
                      (widget.ranges[i - 1].minValue + (widget.toggleSize / 2)),
              bottom: i == (widget.ranges.length - 1)
                  ? 0
                  : widget.ranges[i + 1].minValue + (widget.toggleSize / 2),
              child: Container(
                width: widget.lineWidth,
                decoration: BoxDecoration(
                  color: widget.ranges[i].color,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                ),
              ),
            );
          },
        ),
        // Positioned(
        //   top: 0,
        //   bottom: red + (widget.toggleSize / 2),
        //   child: Container(
        //     width: widget.lineWidth,
        //     decoration: const BoxDecoration(
        //       color: Colors.red,
        //       borderRadius: BorderRadius.only(
        //         topLeft: Radius.circular(100),
        //         topRight: Radius.circular(100),
        //       ),
        //     ),
        //   ),
        // ),
        // Positioned(
        //   top: widget.sliderHeight - (red + (widget.toggleSize / 2)),
        //   bottom: yellow + (widget.toggleSize / 2),
        //   child: Container(
        //     width: widget.lineWidth,
        //     decoration: const BoxDecoration(
        //       color: Colors.blue,
        //     ),
        //   ),
        // ),
        // Positioned(
        //   top: widget.sliderHeight - (yellow + (widget.toggleSize / 2)),
        //   bottom: green + (widget.toggleSize / 2),
        //   child: Container(
        //     width: widget.lineWidth,
        //     decoration: const BoxDecoration(
        //       color: Colors.amber,
        //     ),
        //   ),
        // ),
        // Positioned(
        //   top: widget.sliderHeight - (green + (widget.toggleSize / 2)),
        //   bottom: 0,
        //   child: Container(
        //     width: widget.lineWidth,
        //     decoration: const BoxDecoration(
        //       color: Colors.green,
        //       borderRadius: BorderRadius.only(
        //         bottomLeft: Radius.circular(100),
        //         bottomRight: Radius.circular(100),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  Widget background() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: widget.sliderHeight.toDouble(),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          ...List.generate(
            widget.ranges.length,
            (i) => Positioned(
              top: i == 0
                  ? 0
                  : widget.sliderHeight -
                      (widget.ranges[i - 1].minValue + (widget.toggleSize / 2)),
              bottom: i == (widget.ranges.length - 1)
                  ? 0
                  : widget.ranges[i].minValue + (widget.toggleSize / 2),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(right: widget.toggleSize * 6),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: i.isEven ? Colors.grey[50] : Colors.white,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: widget.ranges[i].color.withOpacity(0.18),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: Text(
                    widget.ranges[i].name,
                    style: TextStyle(
                      color: widget.ranges[i].color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Positioned(
          //   top: 0,
          //   bottom: red + (widget.toggleSize / 2),
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     padding: EdgeInsets.only(right: widget.toggleSize * 6),
          //     alignment: Alignment.centerRight,
          //     decoration: BoxDecoration(
          //       color: Colors.grey[50],
          //     ),
          //     child: Container(
          //       padding: const EdgeInsets.symmetric(
          //         vertical: 8,
          //         horizontal: 12,
          //       ),
          //       decoration: BoxDecoration(
          //         color: Colors.red[50],
          //         borderRadius: const BorderRadius.all(
          //           Radius.circular(100),
          //         ),
          //       ),
          //       child: const Text(
          //         'Escalation Risk',
          //         style: TextStyle(
          //           color: Colors.red,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   top: widget.sliderHeight - (red + (widget.toggleSize / 2)),
          //   bottom: yellow + (widget.toggleSize / 2),
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     padding: EdgeInsets.only(right: widget.toggleSize * 6),
          //     alignment: Alignment.centerRight,
          //     decoration: const BoxDecoration(
          //       color: Colors.white,
          //     ),
          //     child: Container(
          //       padding: const EdgeInsets.symmetric(
          //         vertical: 8,
          //         horizontal: 12,
          //       ),
          //       decoration: BoxDecoration(
          //         color: Colors.blue[50],
          //         borderRadius: const BorderRadius.all(
          //           Radius.circular(100),
          //         ),
          //       ),
          //       child: const Text(
          //         'High Risk',
          //         style: TextStyle(
          //           color: Colors.blue,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   top: widget.sliderHeight - (yellow + (widget.toggleSize / 2)),
          //   bottom: green + (widget.toggleSize / 2),
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     padding: EdgeInsets.only(right: widget.toggleSize * 6),
          //     alignment: Alignment.centerRight,
          //     decoration: BoxDecoration(
          //       color: Colors.grey[50],
          //     ),
          //     child: Container(
          //       padding: const EdgeInsets.symmetric(
          //         vertical: 8,
          //         horizontal: 12,
          //       ),
          //       decoration: BoxDecoration(
          //         color: Colors.amber[50],
          //         borderRadius: const BorderRadius.all(
          //           Radius.circular(100),
          //         ),
          //       ),
          //       child: const Text(
          //         'Medium Risk',
          //         style: TextStyle(
          //           color: Colors.amber,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   top: widget.sliderHeight - (green + (widget.toggleSize / 2)),
          //   bottom: 0,
          //   child: Container(
          //     width: MediaQuery.of(context).size.width,
          //     padding: EdgeInsets.only(right: widget.toggleSize * 6),
          //     alignment: Alignment.centerRight,
          //     decoration: const BoxDecoration(
          //       color: Colors.white,
          //     ),
          //     child: Container(
          //       padding: const EdgeInsets.symmetric(
          //         vertical: 8,
          //         horizontal: 12,
          //       ),
          //       decoration: BoxDecoration(
          //         color: Colors.green[50],
          //         borderRadius: const BorderRadius.all(
          //           Radius.circular(100),
          //         ),
          //       ),
          //       child: const Text(
          //         'Low Risk',
          //         style: TextStyle(
          //           color: Colors.green,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
