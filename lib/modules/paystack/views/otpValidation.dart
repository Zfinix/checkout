import 'package:checkout/globals/utils/margin.dart';
import 'package:checkout/globals/widgets/loader.dart';
import 'package:checkout/modules/paystack/providers/otpValidatorProvider.dart';
import 'package:flutter/material.dart';
import 'package:pin_view/pin_view.dart';
import 'package:provider/provider.dart';

class OTPValidation extends StatefulWidget {
  final String reference, amount;

  OTPValidation({
    Key key,
    @required this.reference,
    @required this.amount,
  }) : super(key: key);

  _OTPValidationState createState() => _OTPValidationState();
}

class _OTPValidationState extends State<OTPValidation> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OTPValidatorProvider>(builder: (context, counter, _) {
      var controller = Provider.of<OTPValidatorProvider>(context);

      return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white, //change your color here
            ),
            backgroundColor: Colors.green,
            brightness: Brightness.dark,
            elevation: 0,
            title: Text(
              "OTP Verification",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            )),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: ListView(
              children: <Widget>[
                const YMargin(60),
                Text(
                  'Please Enter OTP Code',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                ),
                const YMargin(30),
                Theme(
                  data: ThemeData(
                      primaryColor: Colors.white, accentColor: Colors.white),
                  child: PinView(
                      count: 6,
                      obscureText: true,
                      autoFocusFirstField: true,
                      enabled: true,
                      style: TextStyle(color: Colors.white),
                      submit: (String pin) {
                        controller.isLoading = true;
                        controller.otp = pin;

                        controller.sendOTP(context, widget.reference);
                      }),
                ),
                const YMargin(30),
                controller.isLoading ? CircleLoader() : Container()
              ],
            ),
          ),
        ),
      );
    });
  }
}
