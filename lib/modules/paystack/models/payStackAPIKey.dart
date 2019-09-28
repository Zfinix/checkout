class PaystackAPIKeys {
  int statusCode;
  String message;
  Data data;
  bool isError;

  PaystackAPIKeys({this.statusCode, this.message, this.data, this.isError});

  PaystackAPIKeys.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    isError = json['isError'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['isError'] = this.isError;
    return data;
  }
}

class Data {
  bool isLive;
  String paystackLiveSecretKey;
  String paystackLivePublicKey;
  String paystackDemoSecretKey;
  String paystackDemoPublicKey;
  int id;

  Data(
      {this.isLive,
      this.paystackLiveSecretKey,
      this.paystackLivePublicKey,
      this.paystackDemoSecretKey,
      this.paystackDemoPublicKey,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    isLive = json['isLive'];
    paystackLiveSecretKey = json['paystackLiveSecretKey'];
    paystackLivePublicKey = json['paystackLivePublicKey'];
    paystackDemoSecretKey = json['paystackDemoSecretKey'];
    paystackDemoPublicKey = json['paystackDemoPublicKey'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isLive'] = this.isLive;
    data['paystackLiveSecretKey'] = this.paystackLiveSecretKey;
    data['paystackLivePublicKey'] = this.paystackLivePublicKey;
    data['paystackDemoSecretKey'] = this.paystackDemoSecretKey;
    data['paystackDemoPublicKey'] = this.paystackDemoPublicKey;
    data['id'] = this.id;
    return data;
  }
}
