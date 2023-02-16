import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

enum ConfirmationEvent {
  resetPasswordSuccess,
  profileUpdatedSuccess,
  ;
}

enum Role {
  superUser,
  manager,
  supervisor,
  employee,
  ;
}

enum ReportRole {
  observer,
  validator;
}

enum NewVsExistingUser {
  newUser,
  existingUser;
}

enum PageState {
  edit,
  view,
  viewAsMe,
  viewAsOther,
  ;
}

enum StatusCode {
  badRequest(401, 'Bad request'),
  unauthorized(401, 'Unauthorized'),
  forbidden(403, 'Forbidden'),
  notFound(404, 'Not found'),
  internalServerError(500, 'Internal server error'),
  notImplemented(501, 'Not implemented');

  const StatusCode(this.code, this.description);
  final int code;
  final String description;

  @override
  String toString() => 'StatusCode($code, $description)';
}

enum RiskLevel {
  low(Icons.insert_emoticon, LightColors.kGreen),
  medium(Icons.sentiment_neutral, LightColors.kPrimaryColor),
  high(Icons.sentiment_dissatisfied, LightColors.kDarkYellow),
  escalation(Icons.sentiment_very_dissatisfied, LightColors.kDangerColor);

  const RiskLevel(this.iconData, this.color);
  final IconData iconData;
  final Color color;

  @override
  String toString() => 'RiskLevel($iconData, $color)';
}
