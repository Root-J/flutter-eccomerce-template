import 'package:flutter/material.dart';

class HeaderPadding extends StatelessWidget {
  /// This Widget is made to prevent conflicts in padding numbers and make a fixed theme for the app
  /// it made to carry [TextHeader] widget as it inserts it in Column
  /// between 48 and 32 vertical Paddings
  ///
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
