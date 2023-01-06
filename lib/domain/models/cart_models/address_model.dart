class AddressModel {
  AddressModel({
    this.town,
    this.addressDetails,
    this.phone,
    this.isDefault,
  });
  String? town;
  String? addressDetails;
  String? phone;
  bool? isDefault;

  AddressModel.fromJson(Map<String, dynamic> json) {
    town = json['address town'];
    addressDetails = json['address details'];
    phone = json['phone'];
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['address town'] = town;
    data['address details'] = addressDetails;
    data['phone'] = phone;
    data['isDefault'] = isDefault;
    return data;
  }
}
