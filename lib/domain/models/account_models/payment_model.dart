class CreditCardModel {
  String? number;
  String? holder;
  String? expireDate;
  String? securityCode;

  CreditCardModel(
      {this.number, this.holder, this.expireDate, this.securityCode});

  CreditCardModel.fromJson(Map<String, dynamic> json) {
    number = json["number"];
    holder = json["holder"];
    expireDate = json["expireDate"];
    securityCode = json["security code"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["number"] = number;
    data["holder"] = holder;
    data["expireDate"] = expireDate;
    data["security code"] = securityCode;
    return data;
  }
}
