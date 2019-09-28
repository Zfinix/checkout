import 'package:checkout/globals/utils/margin.dart';
import 'package:checkout/globals/widgets/buttons.dart';
import 'package:flutter/material.dart';

import 'checkoutPage.dart';

class CardPage extends StatefulWidget {
  CardPage({Key key}) : super(key: key);

  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Checkout',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          const YMargin(50),
          Center(
            child: new CardStack(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const YMargin(16),
                    Row(
                      children: <Widget>[
                        Image.asset('assets/images/visa.jpg'),
                      ],
                    ),
                    const YMargin(18),
                    Text(
                      'CARD NUMBER',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w200,
                          color: Colors.grey),
                    ),
                    const YMargin(8),
                    Text(
                      '0000 0000 0000 0000',
                      style: TextStyle(
                          wordSpacing: 6,
                          fontSize: 16,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w500,
                          color: Colors.green[900].withOpacity(0.2)),
                    ),
                    const YMargin(24),
                    Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'EXPIRY',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.grey),
                            ),
                            const YMargin(5),
                            Text(
                              '00/00',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.2)),
                            ),
                          ],
                        ),
                        const XMargin(30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'CVV',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w200,
                                  color: Colors.grey),
                            ),
                            const YMargin(5),
                            Text(
                              '•••',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black.withOpacity(0.2)),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const YMargin(30),
          Center(
            child: Text(
              'Or Checkout With',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w200,
                  color: Colors.grey),
            ),
          ),
          const YMargin(16),
          ImageButton(
            onTap: () {},
            logo: 'rave',
            scale: 2.5,
            color: Colors.amber[500].withOpacity(0.16),
          ),
          ImageButton(
            onTap: () {},
            logo: 'stripe',
            scale: 5,
            color: Colors.amber[500].withOpacity(0.16),
          ),
          const YMargin(10),
          ImageButton(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CheckoutPage(),
              ),
            ),
            width: screenWidth(context),
            logo: 'paystack',
            scale: 5,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

class CardStack extends StatelessWidget {
  final Widget child;
  const CardStack({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 219,
                width: screenWidth(context, percent: 0.61),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    new BoxShadow(
                      offset: Offset(0, -1),
                      spreadRadius: -10,
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 13.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 219,
                  width: screenWidth(context, percent: 0.71),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      new BoxShadow(
                        offset: Offset(0, -1),
                        spreadRadius: -10,
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 219,
                  width: screenWidth(context, percent: 0.83),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      new BoxShadow(
                        offset: Offset(0, -1),
                        spreadRadius: -10,
                        color: Colors.black.withOpacity(0.18),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Center(
          child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16),
              child: child),
        ),
      ],
    );
  }
}
