import 'package:checkout/modules/paystack/api/paystackApi.dart';
import 'package:checkout/modules/paystack/views/successPage.dart';
import 'package:flutter/material.dart';

class OTPValidatorProvider extends ChangeNotifier {
  String _otp;
  String get otp => _otp;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set otp(String otp) {
    _otp = otp;
    notifyListeners();
  }

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  sendOTP(context, reference) async {
    var otpResponse = await PaystackAPI.validateOTP(
      context,
      otp: otp,
      reference: reference,
    );

    if (otpResponse != null) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SucessPage(data: otpResponse),
        ),
      );

      isLoading = false;
    }
  }
}
