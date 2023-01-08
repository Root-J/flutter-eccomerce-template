class CreditCardModel {
  String? number;
  String? holder;
  String? expireDate;

  CreditCardModel({this.number, this.holder, this.expireDate});

  CreditCardModel.fromJson(Map<String, dynamic> json) {
    number = json["number"];
    holder = json["holder"];
    expireDate = json["expireDate"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["number"] = number;
    data["holder"] = holder;
    data["expireDate"] = expireDate;
    return data;
  }
}
