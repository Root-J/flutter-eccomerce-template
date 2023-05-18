import 'package:ecommerce_flutter/presentation/resources/assets_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/colors_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/text_styles_manager.dart';
import 'package:ecommerce_flutter/presentation/resources/values_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/view/descendants_scaffold.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/view_model/birthday_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../resources/decoration_manager.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({Key? key}) : super(key: key);

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final BirthdayViewModel _viewModel = BirthdayViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.start();
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.dispose();
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
              decoration: AppDecoration.defaultBoxDecoration,
              padding: const EdgeInsets.all(AppPadding.p12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _viewModel.birthday == null
                        ? ''
                        : DateFormat('dd-MM-yyyy').format(_viewModel.birthday!),
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
              decoration: AppDecoration.defaultBoxDecoration,
              child: CalendarDatePicker(
                  initialDate: _viewModel.birthday != null
                      ? _viewModel.birthday!
                      : DateTime.now(),
                  firstDate: DateTime(1940),
                  lastDate: DateTime(2025),
                  onDateChanged: (DateTime value) =>
                      setState(() => _viewModel.birthday = value)),
            ),
          ],
        ),
        fabFun: () => _viewModel.saveButton(context));
  }
}
