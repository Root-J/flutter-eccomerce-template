class AddressModel {
  AddressModel({
    this.name,
    this.street,
    this.phone,
    this.state,
    this.zipCode,
    this.country,
    this.isDefault,
  });
  String? name;
  String? street;
  String? street2;
  String? phone;
  String? state;
  String? zipCode;
  String? countryCode;
  String? country;
  bool? isDefault;

  AddressModel.fromJson(Map<String, dynamic> json) {
    name = json['address name'];
    street = json['address street'];
    if (street2 != null) {
      street2 = json['address street 2'];
    }
    phone = json['phone'];
    state = json['state'];
    zipCode = json['zip code'];
    country = json['country'];
    countryCode = json['country code'];
    isDefault = json['isDefault'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['address name'] = name;
    data['address street'] = street;
    data['address street 2'] = street2;
    data['phone'] = phone;
    data['state'] = state;
    data['zip code'] = zipCode;
    data['country'] = country;
    data['country code'] = countryCode;
    data['isDefault'] = isDefault;
    return data;
  }
}
