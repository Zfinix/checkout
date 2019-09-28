class APIUrl {
  static String key = 'YOUR_API_KEY';

  static const String baseUrl = 'https://api.paystack.co';
  static const String intialize = '$baseUrl/transaction/initialize';
  static const String charge = '$baseUrl/charge';
  static const String verifyOTP = '$charge/submit_otp';
  static String verifyCard(bin) => '$baseUrl/decision/bin/$bin';
}
