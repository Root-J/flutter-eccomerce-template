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
    final _data = <String, dynamic>{};
    _data['address name'] = name;
    _data['address street'] = street;
    _data['address street 2'] = street2;
    _data['phone'] = phone;
    _data['state'] = state;
    _data['zip code'] = zipCode;
    _data['country'] = country;
    _data['country code'] = countryCode;
    _data['isDefault'] = isDefault;
    return _data;
  }
}
