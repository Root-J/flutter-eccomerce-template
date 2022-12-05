import 'package:flutter/material.dart';

import 'colors_manager.dart';
import 'values_manager.dart';

class AppDecoration {
  const AppDecoration();

  static BoxDecoration lightRoundedBorder = BoxDecoration(
      borderRadius: BorderRadius.circular(AppCircularRadius.cr5),
      border: Border.all(color: AppColors.neutralLight));
}
