import 'package:checkout/modules/paystack/views/cardPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/paystack/providers/checkoutProvider.dart';
import 'modules/paystack/providers/otpValidatorProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (_) => CheckoutProvider()),
          ChangeNotifierProvider(builder: (_) => OTPValidatorProvider()),
        ],
        child: MaterialApp(
          title: 'Paystack Checkout',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Colors.white,
              primarySwatch: Colors.green,
              accentColor: Colors.green),
          home: CardPage(),
        ));
  }
}
