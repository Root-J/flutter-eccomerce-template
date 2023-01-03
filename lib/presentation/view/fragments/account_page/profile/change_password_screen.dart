import 'package:ecommerce_flutter/core/validation/password_validator.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/descendants_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../data/profile_data/account_data.dart';
import '../../../../resources/assets_manager.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/decoration_manager.dart';
import '../../../../resources/routes_manager.dart';
import '../../../../resources/text_styles_manager.dart';
import '../../../../resources/values_manager.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  String? oldPassword;
  late SharedPreferences prefs;

  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordAgainController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initial();
  }

  initial() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      oldPassword = prefs.getString(AppStrings.password);
    });
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
    newPasswordAgainController.dispose();
    newPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileDescendantsScaffold(
        title: AppStrings.changePassword,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <PasswordCard>[
              PasswordCard(
                passwordController: passwordController,
                valFunction: (val) {
                  if (val != oldPassword) {
                    return AppStrings.passwordNotMatchingMessage;
                  }
                  return null;
                },
                title: AppStrings.oldPassword,
              ),
              PasswordCard(
                passwordController: newPasswordController,
                valFunction: (val) {
                  if (!PasswordValidator().validate(val)) {
                    return PasswordValidator().getMessage();
                  }
                  return null;
                },
                title: AppStrings.newPassword,
              ),
              PasswordCard(
                passwordController: newPasswordAgainController,
                valFunction: (val) {
                  if (newPasswordController.text != val) {
                    return AppStrings.passwordNotMatchingMessage;
                  }
                  return null;
                },
                title: AppStrings.newPasswordAgain,
              )
            ],
          ),
        ),
        fabFun: () {
          if (_formKey.currentState!.validate() &&
              newPasswordController.text != oldPassword) {
            SharedPrefs.save(
                key: AppStrings.password,
                value: newPasswordAgainController.text);
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.accountProfileRoute, (route) => false);
          }
        });
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
