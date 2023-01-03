class AddressModel {
  final String town;
  final String addressDetails;
  final String phone;
  bool isDefault;

  AddressModel(
      {required this.town,
      required this.addressDetails,
      required this.phone,
      this.isDefault = false});
}
