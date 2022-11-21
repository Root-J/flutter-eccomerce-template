import 'package:flutter/material.dart';

class HeaderPadding extends StatelessWidget {
  final Widget widget;
  const HeaderPadding({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 48),
        widget,
        const SizedBox(height: 32),
      ],
    );
  }
}
