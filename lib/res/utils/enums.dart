import '/res/theme/colors/light_colors.dart';
import 'package:flutter/material.dart';

enum ConfirmationEventEnum {
  resetPasswordSuccess,
  profileUpdatedSuccess,
  ;
}

enum RoleEnum {
  superUser,
  company,
  manager,
  supervisor,
  employee,
}

enum ReportRoleEnum {
  observer,
  validator;
}

enum NewVsExistingUserEnum {
  newUser,
  existingUser;
}

enum PageStateEnum {
  create,
  edit,
  view,
  viewAsMe,
  viewAsOther,
  ;
}

enum StatusCodeEnum {
  badRequest(401, 'Bad request'),
  unauthorized(401, 'Unauthorized'),
  forbidden(403, 'Forbidden'),
  notFound(404, 'Not found'),
  internalServerError(500, 'Internal server error'),
  notImplemented(501, 'Not implemented');

  const StatusCodeEnum(this.code, this.description);
  final int code;
  final String description;

  @override
  String toString() => 'StatusCode($code, $description)';
}

enum RiskLevelEnum {
  low(Icons.insert_emoticon, LightColors.kGreen),
  medium(Icons.sentiment_neutral, LightColors.kPrimaryColor),
  high(Icons.sentiment_dissatisfied, LightColors.kDarkYellow),
  escalation(Icons.sentiment_very_dissatisfied, LightColors.kDangerColor);

  const RiskLevelEnum(this.iconData, this.color);
  final IconData iconData;
  final Color color;

  @override
  String toString() => 'Risk Level($iconData, $color)';
}

enum ReportCategoryEnum {
  safeObservation(Icons.insert_emoticon, LightColors.kGreen),
  unSafeObservation(Icons.sentiment_neutral, LightColors.kPrimaryColor),
  nearMiss(Icons.sentiment_dissatisfied, LightColors.kDarkYellow),
  hipo(Icons.sentiment_very_dissatisfied, LightColors.kDangerColor);

  const ReportCategoryEnum(this.iconData, this.color);
  final IconData iconData;
  final Color color;
}
