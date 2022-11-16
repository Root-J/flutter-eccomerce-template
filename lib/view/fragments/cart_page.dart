import 'package:flutter/material.dart';

import '../../constants/const_text_styles.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Cart Page', style: const AppTextStyles().headingH1),
    );
  }
}
