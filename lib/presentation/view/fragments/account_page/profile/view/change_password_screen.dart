import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/view/descendants_scaffold.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/view_model/change_password_view_model.dart';
import 'package:flutter/material.dart';

import '../../../../../resources/assets_manager.dart';
import '../../../../../resources/colors_manager.dart';
import '../../../../../resources/decoration_manager.dart';
import '../../../../../resources/text_styles_manager.dart';
import '../../../../../resources/values_manager.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final ChangePasswordViewModel _viewModel = ChangePasswordViewModel();
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
        title: AppStrings.changePassword,
        child: Form(
          key: _viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <PasswordCard>[
              PasswordCard(
                passwordController: _viewModel.passwordController,
                valFunction: (val) => _viewModel.oldPasswordMatch(val),
                title: AppStrings.oldPassword,
              ),
              PasswordCard(
                passwordController: _viewModel.newPasswordController,
                valFunction: (val) => _viewModel.newPasswordFormat(val),
                title: AppStrings.newPassword,
              ),
              PasswordCard(
                passwordController: _viewModel.newPasswordAgainController,
                valFunction: (val) => _viewModel.newPasswordMatch(val),
                title: AppStrings.newPasswordAgain,
              )
            ],
          ),
        ),
        fabFun: () => _viewModel.saveButton(context));
  }
}

class PasswordCard extends StatelessWidget {
  const PasswordCard({
    Key? key,
    required this.passwordController,
    required this.valFunction,
    required this.title,
  }) : super(key: key);

  final TextEditingController passwordController;
  final String? Function(String?)? valFunction;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const AppTextStyles()
                .headingH5
                .copyWith(color: AppColors.neutralDark)),
        const SizedBox(height: AppMargin.m12),
        PasswordField(
            title: title,
            passwordController: passwordController,
            valFunction: valFunction),
        const SizedBox(height: AppMargin.m24),
      ],
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
    required this.title,
    required this.passwordController,
    required this.valFunction,
  }) : super(key: key);

  final String title;
  final TextEditingController passwordController;
  final String? Function(String?)? valFunction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: AppDecoration.formFieldDecoration(title).copyWith(
          prefixIcon: Image.asset(
        SystemIcons.passwordIcon,
        scale: AppSize.s24,
        color: AppColors.primaryBlue,
      )),
      obscureText: true,
      style: const AppTextStyles()
          .formTextFill
          .copyWith(color: AppColors.neutralGrey),
      controller: passwordController,
      keyboardType: TextInputType.text,
      validator: valFunction,
    );
  }
}
