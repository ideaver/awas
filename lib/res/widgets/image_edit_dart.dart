import 'package:flutter/material.dart';

import '../theme/colors/light_colors.dart';
import 'kcard_widget.dart';

class ImageEditWidget extends StatelessWidget {
  const ImageEditWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            width: 120,
            height: 120,
            child: Center(
              child: Stack(children: [
                KcardWidget(
                    onTap: () {},
                    elevation: 0.0,
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(0.0),
                    child: Image.asset(
                      'assets/bg1.jpeg',
                      fit: BoxFit.cover,
                    ))
              ]),
            ),
          ),
          Positioned(
            right: 2,
            child: Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                  color: LightColors.kDangerColor, shape: BoxShape.circle),
              child: IconButton(
                  alignment: Alignment.center,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: LightColors.kWhiteColor,
                    size: 12,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
