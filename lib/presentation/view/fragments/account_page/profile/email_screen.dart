import 'package:ecommerce_flutter/core/validation/email_validator.dart';
import 'package:ecommerce_flutter/data/profile_data/account_data.dart';
import 'package:ecommerce_flutter/presentation/resources/strings_manager.dart';
import 'package:ecommerce_flutter/presentation/view/fragments/account_page/profile/descendants_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../resources/assets_manager.dart';
import '../../../../resources/colors_manager.dart';
import '../../../../resources/decoration_manager.dart';
import '../../../../resources/routes_manager.dart';
import '../../../../resources/text_styles_manager.dart';
import '../../../../resources/values_manager.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  String? email;
  late SharedPreferences prefs;

  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initial();
  }

  initial() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString(AppStrings.email);
      emailController.text = email!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ProfileDescendantsScaffold(
        title: AppStrings.email,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
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
                  controller: emailController,
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
        fabFun: () {
          if (_formKey.currentState!.validate() &&
              email != emailController.text) {
            SharedPrefs.save(
                key: AppStrings.email, value: emailController.text);
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.accountProfileRoute, (route) => false);
          }
        });
  }
}
