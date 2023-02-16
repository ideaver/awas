import 'package:awas/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'enums.dart';

bool isLogedin = false;
Role currentUserRole = Role.employee;

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> ksnackBarWidget(
    BuildContext context, String title) {
  ScaffoldMessenger.of(context).clearSnackBars();
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(defaultMargin))),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.horizontal,
    content: Text(title),
    backgroundColor: LightColors.kDangerColor,
    duration: const Duration(seconds: 3),
  ));
}

/// System overlays should be drawn with a light color. Intended for
/// applications with a dark background.
const SystemUiOverlayStyle lightStatusBar = SystemUiOverlayStyle(
  systemNavigationBarColor: null, //<------ changed
  systemNavigationBarDividerColor: null,
  statusBarColor: Colors.transparent,
  systemNavigationBarIconBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.light,
  statusBarBrightness: Brightness.dark,
);

/// System overlays should be drawn with a dark color. Intended for
/// applications with a light background.
const SystemUiOverlayStyle darkStatusBar = SystemUiOverlayStyle(
  systemNavigationBarColor: null, //<------ changed
  systemNavigationBarDividerColor: null,
  statusBarColor: LightColors.kBackgroundColor,
  systemNavigationBarIconBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  statusBarBrightness: Brightness.light,
);
