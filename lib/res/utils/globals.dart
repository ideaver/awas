import 'package:awas/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

bool isLogedin = false;

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
