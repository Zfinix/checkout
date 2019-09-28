class CardData {
  String cardId;
  String cardNumber;
  String expiryMonth;
  String expiryYear;
  String cvv;

  CardData(
      {this.cardId,
      this.cardNumber,
      this.expiryMonth,
      this.expiryYear,
      this.cvv});

  CardData.fromJson(Map<String, dynamic> json) {
    cardId = json['card_id'];
    cardNumber = json['card_number'];
    expiryMonth = json['expiry_month'];
    expiryYear = json['expiry_year'];
    cvv = json['cvv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['card_id'] = this.cardId;
    data['card_number'] = this.cardNumber;
    data['expiry_month'] = this.expiryMonth;
    data['expiry_year'] = this.expiryYear;
    data['cvv'] = this.cvv;
    return data;
  }
}