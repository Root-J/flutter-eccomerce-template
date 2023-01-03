import 'package:ecommerce_flutter/data/profile_data/account_data.dart';
import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/descendants_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../resources/routes_manager.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({Key? key}) : super(key: key);

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  DateTime? birthday;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    prefs = await SharedPreferences.getInstance();
    String? temp = prefs.getString(AppStrings.birthday);
    setState(() {
      if (temp != null) {
        birthday = DateFormat('dd-MM-yyyy').parse(temp);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProfileDescendantsScaffold(
        title: AppStrings.birthday,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${AppStrings.your} ${AppStrings.birthday}',
                style: const AppTextStyles()
                    .headingH5
                    .copyWith(color: AppColors.neutralDark)),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppCircularRadius.cr5),
                  border: Border.all(color: AppColors.neutralLight)),
              padding: const EdgeInsets.all(AppPadding.p12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    birthday == null
                        ? ''
                        : DateFormat('dd-MM-yyyy').format(birthday!),
                    style: const AppTextStyles()
                        .formTextFill
                        .copyWith(color: AppColors.neutralGrey),
                  ),
                  Image.asset(
                    SystemIcons.dateIcon,
                    scale: AppSize.s24,
                    color: AppColors.primaryBlue,
                  )
                ],
              ),
            ),
            const SizedBox(height: AppMargin.m8),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppCircularRadius.cr5),
                  border: Border.all(color: AppColors.neutralLight)),
              child: CalendarDatePicker(
                  initialDate: birthday != null ? birthday! : DateTime.now(),
                  firstDate: DateTime(1940),
                  lastDate: DateTime(2025),
                  onDateChanged: (DateTime value) =>
                      setState(() => birthday = value)),
            ),
          ],
        ),
        fabFun: () {
          SharedPrefs.save(
              key: AppStrings.birthday,
              value: DateFormat('dd-MM-yyyy').format(birthday!));
          Navigator.pushNamed(context, Routes.accountProfileRoute);
        });
  }
}
