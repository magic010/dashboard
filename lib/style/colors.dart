import 'package:flutter/material.dart';

import '../helpers/myApplication.dart';

Color onboardingColor = Colors.black38;

Color setToastColor(ToastColors color) {
  Color c;

  switch (color) {
    case ToastColors.error:
      c = Colors.red;
      break;
    case ToastColors.success:
      c = Colors.green;
      break;
    case ToastColors.warning:
      c = Colors.amber;
      break;
  }

  return c;
}
