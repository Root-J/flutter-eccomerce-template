import 'package:ecommerce_flutter/core/validation/email_validator.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/view/descendants_scaffold.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/view_model/email_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../../resources/assets_manager.dart';
import '../../../../../resources/colors_manager.dart';
import '../../../../../resources/decoration_manager.dart';
import '../../../../../resources/text_styles_manager.dart';
import '../../../../../resources/values_manager.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final EmailViewModel _viewModel = EmailViewModel();

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
        title: AppStrings.email,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _viewModel.formKey,
              child: TextFormField(
                  decoration:
                      AppDecoration.formFieldDecoration(AppStrings.email)
                          .copyWith(
                              prefixIcon: Image.asset(
                    SystemIcons.emailIcon,
                    scale: AppSize.s24,
                    color: AppColors.primaryBlue,
                  )),
                  style: const AppTextStyles()
                      .formTextFill
                      .copyWith(color: AppColors.neutralGrey),
                  controller: _viewModel.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (!EmailValidator().validate(val)) {
                      return EmailValidator().getMessage();
                    }
                    return null;
                  }),
            ),
          ],
        ),
        fabFun: () => _viewModel.saveButton(context));
  }
}
