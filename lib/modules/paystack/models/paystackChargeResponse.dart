class PayStackChargeResponse {
  bool status;
  String message;
  Data data;

  PayStackChargeResponse({this.status, this.message, this.data});

  PayStackChargeResponse.fromJson(Map<String, dynamic> json) {
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
  String authorizationUrl;
  String accessCode;
  String reference;

  Data({this.authorizationUrl, this.accessCode, this.reference});

  Data.fromJson(Map<String, dynamic> json) {
    authorizationUrl = json['authorization_url'];
    accessCode = json['access_code'];
    reference = json['reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorization_url'] = this.authorizationUrl;
    data['access_code'] = this.accessCode;
    data['reference'] = this.reference;
    return data;
  }
}