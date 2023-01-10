import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../res/theme/colors/light_colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kBackgroundColor,
      body: Stack(children: [
        Image.network(
          'https://images.unsplash.com/photo-1552879890-3a06dd3a06c2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzM4Mzh8MHwxfHNlYXJjaHwyM3x8c2hpcHBpbmclMjBzYWZldHl8ZW58MHx8fHwxNjcyNjUyODY2&ixlib=rb-4.0.3&q=80&w=400',
        ),
        Stack(children: [
          Positioned(
            top: 200,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 500,
              decoration: const BoxDecoration(
                  color: LightColors.kBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(defaultCircular),
                      topRight: Radius.circular(defaultCircular))),
              child: ListView(
                padding: const EdgeInsets.all(defaultMargin),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello!',
                              style: LightColors.titleTextStyle,
                            ),
                            Text(
                              'Welcome to AWAS app',
                              overflow: TextOverflow.visible,
                              style: LightColors.subTitleTextStyle,
                            ),
                            Text(
                              'Awareness for Safety-Application',
                              overflow: TextOverflow.visible,
                              style: LightColors.subTitleTextStyle
                                  .copyWith(fontSize: 14),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ])
      ]),
    );
  }

  //   savePref(BuildContext context,String? id) async {
  //   await SessionManager().set("id", id).then((value) =>
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (BuildContext context) => home())));
  // }

  // Future<void> checksession(BuildContext context) async {
  //   dynamic id = await SessionManager().get("id").then((value) =>
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (BuildContext context) => home())));
  // }

}
