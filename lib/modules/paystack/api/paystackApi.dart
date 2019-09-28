import 'dart:convert';

import 'package:checkout/globals/urlConstants.dart';
import 'package:checkout/modules/paystack/models/otpChargeResponse.dart';
import 'package:checkout/modules/paystack/models/otpValidationResponse.dart';
import 'package:checkout/modules/paystack/models/paystackBinResponse.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:checkout/modules/paystack/models/paystackChargeModel.dart';

class PaystackAPI {
  static bool isValid = false;
  static String cardType = '';
  static String paymentURL = '';

  static Future<String> initTransaction(
    BuildContext context, {
    @required String amount,
    @required String email,
    @required Metadata metadata,
  }) async {
    String amt = (int.parse(amount)).toString();

    try {
      var headers = {
        'Authorization': "Bearer " + APIUrl.key,
      };

      PayStackChargeCardModel charge = new PayStackChargeCardModel(
          amount: amt, card: null, email: email, metadata: metadata, pin: null);

      final response = await http.post(APIUrl.intialize,
          body: json.encode(charge.toJson()), headers: headers);

      if (response.body.contains("Authorization URL created")) {
        return response.body;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<OTPChargeResponse> charge(context,{
    @required String amount,
    @required String email,
    @required CardDetails card,
    @required Metadata metadata,
    @required String pin,
  }) async {
    String amt = (double.parse(amount) * 1000).toString();

    try {
      var headers = {
        'Authorization': "Bearer " + APIUrl.key,
        'Content-Type': 'application/json'
      };

      Map data = {
        "email": email,
        "amount": amt,
        "metadata": {
          "custom_fields": [
            {
              "value": amt,
              "display_name": metadata.customFields[0].displayName,
              "variable_name": metadata.customFields[0].variableName
            }
          ]
        },
        "card": {
          "cvv": card.cvv,
          "number": card.number,
          "expiry_month": card.expiryMonth,
          "expiry_year": card.expiryYear
        },
        "pin": pin
      };

      //POST REQUEST BUILD

      final response = await http.post(APIUrl.charge,
          body: json.encode(data), headers: headers);
      print(response.body);

      if (response.statusCode == 200 && response.body.contains("send_otp")) {
        return OTPChargeResponse.fromJson(json.decode(response.body));
      } else {
        showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                    title: new Text("Error"),
                    content: new Text("${json.decode(response.body)['data']['message']}"),
                  )); 
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  static Future<OTPValidationResponse> validateOTP(
    BuildContext context, {
    @required String reference,
    @required String otp,
  }) async {
    try {
      var headers = {
        'Authorization': "Bearer " + APIUrl.key,
      };

      Map data = {
        "otp": otp,
        "reference": reference,
      };

      //POST REQUEST BUILD
      final response =
          await http.post(APIUrl.verifyOTP, body: data, headers: headers);

      if (response.statusCode == 200 &&
          response.body.contains('"status": "success"')) {
        return OTPValidationResponse.fromJson(json.decode(response.body));
      } else if (response.body.contains('failed')) {
        showDialog(
            context: context,
            builder: (_) => new AlertDialog(
                  title: new Text('Opps...'),
                  content: new Text(
                      'Your Transaction Failed: An invalid Token was supplied'),
                ));
      } else {}
    } catch (e) {
      print(e.toString());
    }

    return null;
  }

  static Future<bool> verifyCard(
    String bin,
    BuildContext context,
  ) async {
    try {
      var headers = {
        'Authorization': "Bearer " + APIUrl.key,
        'Content-Type': 'application/json'
      };

      //POST REQUEST BUILD

      final response = await http.get(APIUrl.verifyCard(bin), headers: headers);
      debugPrint(response.body);
      if (response.body != null) {
        VerifyCard cardResponse =
            VerifyCard.fromJson(json.decode(response.body));
        if (cardResponse.data.cardType != null &&
                cardResponse.data.cardType.isNotEmpty ||
            cardResponse.data.bank != null &&
                cardResponse.data.bank.isNotEmpty &&
                cardResponse.data.countryCode != null) {
          isValid = true;
          cardType = cardResponse.data.brand;
          return true;
        } else {
          isValid = false;

          /* showDialog(
              context: context,
              builder: (_) => new AlertDialog(
                    title: new Text("Error"),
                    content: new Text("This Card is invalid"),
                  )); */
        }
      }
    } catch (e) {
      isValid = false;
      print(e.toString());
      return false;
    }
    return false;
  }
}
