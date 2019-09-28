class APIUrl {
  static String key = 'sk_test_8f11d256073116ded93295de02b90ce517cf73c2';

  static const String baseUrl = 'https://api.paystack.co';
  static const String intialize = '$baseUrl/transaction/initialize';
  static const String charge = '$baseUrl/charge';
  static const String verifyOTP = '$charge/submit_otp';
  static String verifyCard(bin) => '$baseUrl/decision/bin/$bin';
}
