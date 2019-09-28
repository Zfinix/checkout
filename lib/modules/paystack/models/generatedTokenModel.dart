class GeneratedToken {
  Success success;

  GeneratedToken({this.success});

  GeneratedToken.fromJson(Map<String, dynamic> json) {
    success =
        json['success'] != null ? new Success.fromJson(json['success']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.success != null) {
      data['success'] = this.success.toJson();
    }
    return data;
  }
}

class Success {
  String error;
  String successMessage;
  String data;

  Success({this.error, this.successMessage, this.data});

  Success.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    successMessage = json['success_message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['success_message'] = this.successMessage;
    data['data'] = this.data;
    return data;
  }
}