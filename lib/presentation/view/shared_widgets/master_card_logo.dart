import 'package:flutter/material.dart';

import '../../resources/colors_manager.dart';
import '../../resources/values_manager.dart';

class MasterCardLogo extends StatelessWidget {
  const MasterCardLogo({
    Key? key,
  }) : super(key: key);

  final radius = AppSize.s24;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.s20 + AppSize.s20 + AppPadding.p12,
      child: Stack(
        children: [
          Container(
            width: radius,
            height: radius,
            decoration: BoxDecoration(
              color: AppColors.neutralDark.withOpacity(AppSize.s32 / 100),
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            left: AppPadding.p16,
            child: Container(
              width: radius,
              height: radius,
              decoration: BoxDecoration(
                color: AppColors.neutralDark.withOpacity(AppSize.s32 / 100),
                shape: BoxShape.circle,
              ),
            ),
          )
        ],
      ),
    );
  }
}
