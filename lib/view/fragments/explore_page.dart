import 'package:flutter/material.dart';

import '../../constants/const_text_styles.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Explore Page', style: kH1()),
    );
  }
}
