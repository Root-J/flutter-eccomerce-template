class PaymentCardModel {
  final String number;
  final String holder;
  final String expireDate;

  const PaymentCardModel(
      {required this.number, required this.holder, required this.expireDate});
}
