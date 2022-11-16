import 'package:flutter/material.dart';

import '../../constants/const_text_styles.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Account Page', style: kH1()),
    );
  }
}
