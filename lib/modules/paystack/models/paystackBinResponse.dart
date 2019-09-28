class VerifyCard {
  bool status;
  String message;
  Data data;

  VerifyCard({this.status, this.message, this.data});

  VerifyCard.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String bin;
  String brand;
  String subBrand;
  String countryCode;
  String countryName;
  String cardType;
  String bank;
  int linkedBankId;

  Data(
      {this.bin,
      this.brand,
      this.subBrand,
      this.countryCode,
      this.countryName,
      this.cardType,
      this.bank,
      this.linkedBankId});

  Data.fromJson(Map<String, dynamic> json) {
    bin = json['bin'];
    brand = json['brand'];
    subBrand = json['sub_brand'];
    countryCode = json['country_code'];
    countryName = json['country_name'];
    cardType = json['card_type'];
    bank = json['bank'];
    linkedBankId = json['linked_bank_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bin'] = this.bin;
    data['brand'] = this.brand;
    data['sub_brand'] = this.subBrand;
    data['country_code'] = this.countryCode;
    data['country_name'] = this.countryName;
    data['card_type'] = this.cardType;
    data['bank'] = this.bank;
    data['linked_bank_id'] = this.linkedBankId;
    return data;
  }
}