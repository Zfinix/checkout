import 'package:checkout/globals/utils/margin.dart';
import 'package:checkout/globals/widgets/buttons.dart';
import 'package:checkout/globals/widgets/loader.dart';
import 'package:checkout/globals/widgets/textFields.dart';
import 'package:checkout/modules/paystack/providers/checkoutProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cardPage.dart';

class CheckoutPage extends StatefulWidget {
  CheckoutPage({Key key}) : super(key: key);

  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  CheckoutProvider controller;
  @override
  void initState() {
    load();
    super.initState();
  }

  load() async {
    await Future.delayed(new Duration(seconds: 1));
    controller.context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutProvider>(builder: (context, counter, _) {
      controller = Provider.of<CheckoutProvider>(context);
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
                      const YMargin(9),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.credit_card,
                            color: Colors.green,
                            size: 35,
                          ),
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
                        '${controller.number ?? ''}',
                        style: TextStyle(
                            wordSpacing: 4,
                            fontSize: 16,
                            letterSpacing: 1.4,
                            fontWeight: FontWeight.w500,
                            color: Colors.green[900]),
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
                                '${controller.validity != null ? controller.validity?.split('/')[0] : ''}/${controller.validity != null && controller.validity.contains('/') ? controller.validity?.split('/')[1] : ''}',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
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
                                    color: Colors.black),
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
            Form(
              key: controller.formKey,
              child: Column(
                children: <Widget>[
                  Email(controller),
                  const YMargin(15),
                  CardNumber(controller, validateCard: controller.validateCard),
                  const YMargin(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Valid(controller),
                      const XMargin(25),
                      CVV(controller),
                    ],
                  ),
                  const YMargin(15),
                  PIN(controller),
                  const YMargin(25),
                  !controller.isLoading
                      ? TextButton(
                          onTap: () => controller.chargeCard(),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 38.0),
                          child: new Loader(),
                        ),
                  const YMargin(30),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
