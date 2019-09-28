class OTPChargeResponse {
  bool status;
  String message;
  Data data;

  OTPChargeResponse({this.status, this.message, this.data});

  OTPChargeResponse.fromJson(Map<String, dynamic> json) {
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
  String reference;
  String status;
  String displayText;

  Data({this.reference, this.status, this.displayText});

  Data.fromJson(Map<String, dynamic> json) {
    reference = json['reference'];
    status = json['status'];
    displayText = json['display_text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reference'] = this.reference;
    data['status'] = this.status;
    data['display_text'] = this.displayText;
    return data;
  }
}