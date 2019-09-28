class OTPValidationResponse {
  bool status;
  String message;
  Data data;

  OTPValidationResponse({this.status, this.message, this.data});

  OTPValidationResponse.fromJson(Map<String, dynamic> json) {
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
  int id;
  String domain;
  String status;
  String reference;
  int amount;
  Null message;
  String gatewayResponse;
  String paidAt;
  String createdAt;
  String channel;
  String currency;
  String ipAddress;
  Metadata metadata;
  Null log;
  int fees;
  Null feesSplit;
  Authorization authorization;
  Customer customer;
  Null plan;
  String transactionDate;
  Data(
      {this.id,
      this.domain,
      this.status,
      this.reference,
      this.amount,
      this.message,
      this.gatewayResponse,
      this.paidAt,
      this.createdAt,
      this.channel,
      this.currency,
      this.ipAddress,
      this.metadata,
      this.log,
      this.fees,
      this.feesSplit,
      this.authorization,
      this.customer,
      this.plan,
      this.transactionDate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    domain = json['domain'];
    status = json['status'];
    reference = json['reference'];
    amount = json['amount'];
    message = json['message'];
    gatewayResponse = json['gateway_response'];
    paidAt = json['paid_at'];
    createdAt = json['created_at'];
    channel = json['channel'];
    currency = json['currency'];
    ipAddress = json['ip_address'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    log = json['log'];
    fees = json['fees'];
    feesSplit = json['fees_split'];
    authorization = json['authorization'] != null
        ? new Authorization.fromJson(json['authorization'])
        : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    plan = json['plan'];
    paidAt = json['paidAt'];
    createdAt = json['createdAt'];
    transactionDate = json['transaction_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['domain'] = this.domain;
    data['status'] = this.status;
    data['reference'] = this.reference;
    data['amount'] = this.amount;
    data['message'] = this.message;
    data['gateway_response'] = this.gatewayResponse;
    data['paid_at'] = this.paidAt;
    data['created_at'] = this.createdAt;
    data['channel'] = this.channel;
    data['currency'] = this.currency;
    data['ip_address'] = this.ipAddress;
    if (this.metadata != null) {
      data['metadata'] = this.metadata.toJson();
    }
    data['log'] = this.log;
    data['fees'] = this.fees;
    data['fees_split'] = this.feesSplit;
    if (this.authorization != null) {
      data['authorization'] = this.authorization.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer.toJson();
    }
    data['plan'] = this.plan;
    data['paidAt'] = this.paidAt;
    data['createdAt'] = this.createdAt;
    data['transaction_date'] = this.transactionDate;

    return data;
  }
}

class 
Metadata {
  List<CustomFields> customFields;

  Metadata({this.customFields});

  Metadata.fromJson(Map<String, dynamic> json) {
    if (json['custom_fields'] != null) {
      customFields = new List<CustomFields>();
      json['custom_fields'].forEach((v) {
        customFields.add(new CustomFields.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customFields != null) {
      data['custom_fields'] = this.customFields.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomFields {
  String value;
  String displayName;
  String variableName;

  CustomFields({this.value, this.displayName, this.variableName});

  CustomFields.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    displayName = json['display_name'];
    variableName = json['variable_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['display_name'] = this.displayName;
    data['variable_name'] = this.variableName;
    return data;
  }
}

class Authorization {
  String authorizationCode;
  String bin;
  String last4;
  String expMonth;
  String expYear;
  String channel;
  String cardType;
  String bank;
  String countryCode;
  String brand;
  bool reusable;
  String signature;

  Authorization(
      {this.authorizationCode,
      this.bin,
      this.last4,
      this.expMonth,
      this.expYear,
      this.channel,
      this.cardType,
      this.bank,
      this.countryCode,
      this.brand,
      this.reusable,
      this.signature});

  Authorization.fromJson(Map<String, dynamic> json) {
    authorizationCode = json['authorization_code'];
    bin = json['bin'];
    last4 = json['last4'];
    expMonth = json['exp_month'];
    expYear = json['exp_year'];
    channel = json['channel'];
    cardType = json['card_type'];
    bank = json['bank'];
    countryCode = json['country_code'];
    brand = json['brand'];
    reusable = json['reusable'];
    signature = json['signature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorization_code'] = this.authorizationCode;
    data['bin'] = this.bin;
    data['last4'] = this.last4;
    data['exp_month'] = this.expMonth;
    data['exp_year'] = this.expYear;
    data['channel'] = this.channel;
    data['card_type'] = this.cardType;
    data['bank'] = this.bank;
    data['country_code'] = this.countryCode;
    data['brand'] = this.brand;
    data['reusable'] = this.reusable;
    data['signature'] = this.signature;
    return data;
  }
}

class Customer {
  int id;
  Null firstName;
  Null lastName;
  String email;
  String customerCode;
  Null phone;
  Null metadata;
  String riskAction;

  Customer(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.customerCode,
      this.phone,
      this.metadata,
      this.riskAction});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    customerCode = json['customer_code'];
    phone = json['phone'];
    metadata = json['metadata'];
    riskAction = json['risk_action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['customer_code'] = this.customerCode;
    data['phone'] = this.phone;
    data['metadata'] = this.metadata;
    data['risk_action'] = this.riskAction;
    return data;
  }
}
class CardDetails {
  String cvv;
  String number;
  String expiryMonth;
  String expiryYear;

  CardDetails({this.cvv,  this.number,  this.expiryMonth,  this.expiryYear});

  CardDetails.fromJson(Map<String, dynamic> json) {
    cvv = json['cvv'];
    number = json['number'];
    expiryMonth = json['expiry_month'];
    expiryYear = json['expiry_year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cvv'] =  this.cvv;
    data['number'] =  this.number;
    data['expiry_month'] =  this.expiryMonth;
    data['expiry_year'] =  this.expiryYear;
    return data;
  }
}