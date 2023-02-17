import 'package:flutter/material.dart';

class MultipleRangeSlider extends StatefulWidget {
  // TODO
  // final RangeModel data;

  final double toggleSize;
  final double sliderHeight;
  final double lineWidth;
  final double toggleBorderWidth;
  final double minValue;
  final double maxValue;

  const MultipleRangeSlider({
    Key? key,
    this.toggleSize = 24,
    this.sliderHeight = 500,
    this.lineWidth = 4,
    this.toggleBorderWidth = 2,
    this.minValue = 0,
    this.maxValue = 500,
  }) : super(key: key);

  @override
  State<MultipleRangeSlider> createState() => _MultipleRangeSliderState();
}

class _MultipleRangeSliderState extends State<MultipleRangeSlider> {
  double red = 300;
  double yellow = 200;
  double green = 100;

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
                  Text(
                    '${widget.maxValue.truncate()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    width: widget.toggleSize,
                    height: widget.sliderHeight,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Stack(
                      children: [
                        ranges(),
                        toggles(),
                      ],
                    ),
                  ),
                  Text(
                    '${widget.minValue.truncate()}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
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
        Positioned(
          bottom: red,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                if (red <= (widget.sliderHeight - widget.toggleSize) &&
                    red >= (yellow + widget.toggleSize)) {
                  red -= details.delta.dy;
                } else if (red < (yellow + widget.toggleSize)) {
                  red = yellow + widget.toggleSize;
                } else if (red > (widget.sliderHeight - widget.toggleSize)) {
                  red = (widget.sliderHeight - widget.toggleSize);
                }
              });
            },
            child: Container(
              width: widget.toggleSize,
              height: widget.toggleSize,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  width: widget.toggleBorderWidth,
                  color: Colors.blue,
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
        ),
        Positioned(
          bottom: yellow,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                if (yellow <= (red - widget.toggleSize) &&
                    yellow >= (green + widget.toggleSize)) {
                  yellow -= details.delta.dy;
                } else if (yellow < (green + widget.toggleSize)) {
                  yellow = green + widget.toggleSize;
                } else if (yellow > (red - widget.toggleSize)) {
                  yellow = red - widget.toggleSize;
                }
              });
            },
            child: Container(
              width: widget.toggleSize,
              height: widget.toggleSize,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  width: widget.toggleBorderWidth,
                  color: Colors.amber,
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
        ),
        Positioned(
          bottom: green,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                if (green <= (yellow - widget.toggleSize) && green >= 0) {
                  green -= details.delta.dy;
                } else if (green < 0) {
                  green = 0;
                } else if (green > (yellow - widget.toggleSize)) {
                  green = yellow - widget.toggleSize;
                }
              });
            },
            child: Container(
              width: widget.toggleSize,
              height: widget.toggleSize,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  width: widget.toggleBorderWidth,
                  color: Colors.green,
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
        ),
      ],
    );
  }

  Widget indicator() {
    return SizedBox(
      width: 54,
      height: widget.sliderHeight,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Positioned(
            bottom: red + (widget.toggleSize / 5),
            child: Text(
              '${red.truncate()}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: yellow + (widget.toggleSize / 5),
            child: Text(
              '${yellow.truncate()}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: green + (widget.toggleSize / 5),
            child: Text(
              '${green.truncate()}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget ranges() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          bottom: red + (widget.toggleSize / 2),
          child: Container(
            width: widget.lineWidth,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                topRight: Radius.circular(100),
              ),
            ),
          ),
        ),
        Positioned(
          top: widget.sliderHeight - (red + (widget.toggleSize / 2)),
          bottom: yellow + (widget.toggleSize / 2),
          child: Container(
            width: widget.lineWidth,
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
          ),
        ),
        Positioned(
          top: widget.sliderHeight - (yellow + (widget.toggleSize / 2)),
          bottom: green + (widget.toggleSize / 2),
          child: Container(
            width: widget.lineWidth,
            decoration: const BoxDecoration(
              color: Colors.amber,
            ),
          ),
        ),
        Positioned(
          top: widget.sliderHeight - (green + (widget.toggleSize / 2)),
          bottom: 0,
          child: Container(
            width: widget.lineWidth,
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget background() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: widget.sliderHeight,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Positioned(
            top: 0,
            bottom: red + (widget.toggleSize / 2),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(right: widget.toggleSize * 6),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: Colors.grey[50],
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: const Text(
                  'Escalation Risk',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: widget.sliderHeight - (red + (widget.toggleSize / 2)),
            bottom: yellow + (widget.toggleSize / 2),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(right: widget.toggleSize * 6),
              alignment: Alignment.centerRight,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: const Text(
                  'High Risk',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: widget.sliderHeight - (yellow + (widget.toggleSize / 2)),
            bottom: green + (widget.toggleSize / 2),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(right: widget.toggleSize * 6),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: Colors.grey[50],
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.amber[50],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: const Text(
                  'Medium Risk',
                  style: TextStyle(
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: widget.sliderHeight - (green + (widget.toggleSize / 2)),
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(right: widget.toggleSize * 6),
              alignment: Alignment.centerRight,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                child: const Text(
                  'Low Risk',
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
