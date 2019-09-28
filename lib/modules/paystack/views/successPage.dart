import 'package:checkout/globals/utils/margin.dart';
import 'package:checkout/globals/widgets/buttons.dart';
import 'package:checkout/modules/paystack/models/otpValidationResponse.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SucessPage extends StatefulWidget {
  final OTPValidationResponse data;
  SucessPage({Key key, @required this.data}) : super(key: key);

  _SucessPageState createState() => _SucessPageState();
}

class _SucessPageState extends State<SucessPage> {
  NumberFormat formatCurrency =
      new NumberFormat.simpleCurrency(name: 'NGN', decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text(
          "Checkout",
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              flex: 2,
              child: Center(
                  child: Text(
                'Thanks!',
                style: TextStyle(fontSize: 21, color: Colors.white),
              )),
            ),
            Flexible(
              flex: 4,
              child: Container(
                height: screenHeight(context, percent: 0.7),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                padding: EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const YMargin(5),
                    Container(
                      height: 90,
                      width: 90,
                      child: Image.network(
                        'https://www.architecturaldigest.in/wp-content/themes/cntraveller/images/check-circle.gif',
                        scale: 2,
                      ),
                    ),
                    const YMargin(40),
                    Column(
                      children: <Widget>[
                        Text(
                          'Thanks for Purchasing.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w200),
                        ),
                        const YMargin(10),
                        Text(
                          'Your Order will be shiped in\n 2-4 International Days', // '${formatCurrency.format(widget.data.data.amount / 1000)}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 1.4,
                            fontSize: 11,
                            color: Colors.grey,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                    const YMargin(20),
                    TextButton(
                      onTap: () {},
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
