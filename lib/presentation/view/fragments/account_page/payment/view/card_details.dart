import 'package:ecommerce_flutter/presentation/view/fragments/account_page/payment/view_model/card_view_model.dart';
import 'package:flutter/material.dart';

class CardManagement extends StatefulWidget {
  const CardManagement({Key? key}) : super(key: key);

  @override
  State<CardManagement> createState() => _CardManagementState();
}

class _CardManagementState extends State<CardManagement> {
  final CardViewModel _cardViewModel = CardViewModel();

  @override
  void initState() {
    _cardViewModel.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
