import 'package:checkout/modules/paystack/api/paystackApi.dart';
import 'package:checkout/modules/paystack/models/otpChargeResponse.dart';
import 'package:checkout/modules/paystack/models/otpValidationResponse.dart';
import 'package:checkout/modules/paystack/models/paystackChargeModel.dart';
import 'package:checkout/modules/paystack/views/otpValidation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class CheckoutProvider extends ChangeNotifier {
  final TextEditingController numberC = TextEditingController();
  final TextEditingController valid = TextEditingController();
  final TextEditingController pin = TextEditingController();

  /* final amountTEC =
      MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');
 */
  final TextEditingController cvvC = TextEditingController();
  final TextEditingController nameC = TextEditingController();
  final TextEditingController emailC = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String _last4 = "";
  String get last4 => _last4;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isCardValid = true;
  bool get isCardValid => _isCardValid;

  String _validity = '';
  String get validity => _validity;

  String _email = '';
  String get email => _email;

  String _number;
  String get number => _number;

  var _icon = 'verve';
  get icon => _icon;

  BuildContext _context;
  BuildContext get context => _context;

  set context(BuildContext val) {
    _context = val;
    notifyListeners();
  }

  set isCardValid(bool _) {
    _isCardValid = _;
    notifyListeners();
  }

  set isLoading(bool _) {
    _isLoading = _;
    notifyListeners();
  }

  set number(String _) {
    _number = _;
    notifyListeners();
  }

  set icon(String _) {
    _icon = _;
    notifyListeners();
  }

  set last4(String _) {
    _last4 = _;
    notifyListeners();
  }

  set validity(String _) {
    _validity = _;
    notifyListeners();
  }

  Future<void> validateCard(value) async {
    if (value.length == 6) {
      _number = numberC.text.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
      try {
        _isCardValid = await PaystackAPI.verifyCard(_number, _context);

        print(_isCardValid);

        String card = PaystackAPI.cardType.toLowerCase();

        if (card.contains('master')) {
          icon = 'mastercard';
        } else if (card.contains('visa')) {
          icon = 'visa';
        } else if (card.contains('america')) {
          icon = 'amex';
        } else if (card.contains('discover')) {
          icon = 'discover';
        } else if (card.contains('verve')) {
          icon = 'verve';
        }
      } catch (e) {
        // Handle error...
      }
    } else if (value.length > 6 && PaystackAPI.isValid) {
      number = numberC.text.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
    } else if (value.length > 8 && PaystackAPI.isValid) {
      last4 = numberC.text.substring(numberC.text.length - 4);
    }
  }

  chargeCard() async {
    try {
      if (formKey.currentState.validate() &&
          numberC.text != null &&
          _isCardValid) {
        _isLoading = true;
        notifyListeners();
        
        CardDetails card = new CardDetails(
            cvv: '${cvvC.text}',
            number: numberC.text,
            expiryMonth:
                '${valid?.text != null ? valid?.text?.split('/')[0] : ''}',
            expiryYear:
                '${valid?.text != null && valid.text.contains('/') ? valid?.text?.split('/')[1] : ''}');

        Metadata metadata = new Metadata(customFields: [
          new CustomFields(
              value: '${5000}',
              displayName: 'Fund SendBucs Wallet',
              variableName: 'walletFunds')
        ]);

        OTPChargeResponse response = await PaystackAPI.charge(
          _context,
          email: emailC.text ?? 'john.doe@example.com',
          amount: double.parse(('${5000}'.replaceAll(",", ""))).toString(),
          pin: '${pin.text}',
          card: card,
          metadata: metadata,
        );

        _isLoading = false;
        notifyListeners();

        if (response != null) {
          formKey.currentState.reset();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPValidation(
                reference: '${response.data.reference}',
                amount: '5000'.replaceAll(',', '').replaceAll('.', ''),
              ),
            ),
          );
        }
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
