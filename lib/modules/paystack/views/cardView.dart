// import 'dart:async';
// import 'dart:convert';

// import 'package:checkout/globals/utils/margin.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_masked_text/flutter_masked_text.dart';
// import 'otpValidation.dart';

// class PaystackPayWithCard extends StatefulWidget {
//   final double amount;

//   PaystackPayWithCard({Key key, this.amount}) : super(key: key);
//   @override
//   PaystackPayWithCardState createState() => new PaystackPayWithCardState();
// }

// final TextEditingController numberC = TextEditingController();
// final TextEditingController valid = TextEditingController();
// final TextEditingController pin = TextEditingController();
// final TextEditingController cvvC = TextEditingController();
// final TextEditingController nameC = TextEditingController();
// var last4 = "", validity = '';

// class PaystackPayWithCardState extends State<PaystackPayWithCard> {
//   var icon = 'verve';
//   final _formKey = GlobalKey<FormState>();

//   final amountTEC =
//       MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');

//   EnrolleeProfileDetail profile;
//   var isLoading = false;

//   @override
//   void initState() {
//     getData();
//     super.initState();
//   }

//   setName(val) => setState(() {
//         nameC.text = val;
//       });

//   setNumber(val) => setState(() {
//         last4 = val;
//       });

//   setValid(val) => setState(() {
//         validity = valid.text;
//       });

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         appBar: AppBar(
//             iconTheme: IconThemeData(
//               color: Colors.black, //change your color here
//             ),
//             backgroundColor: Colors.white,
//             brightness: Brightness.light,
//             elevation: 4,
//             title: Text(
//               "Pay With Card",
//               style: TextStyle(color: Colors.black),
//             )),
//         body: Padding(
//           padding: const EdgeInsets.only(left: 28.0, right: 28),
//           child: Form(
//             key: _formKey,
//             child: ListView(children: <Widget>[
//               const YMargin(30),
//               Center(child: BuildCard()),
//               const YMargin(30),
//               _buildAmount(hint: '5000'),
//               const YMargin(10),
//               CardNumber(this._validateCard, this.setNumber),
//               Name(this.setName),
//               const YMargin(10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[CVV(), Valid(this.setValid)],
//               ),
//               PIN(),
//               const YMargin(5),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Icon(
//                     Icons.lock_outline,
//                     color: Colors.grey,
//                     size: 19,
//                   ),
//                   const XMargin(3),
//                   Text(
//                     'Secure Payments',
//                     style: TextStyle(
//                         color: Colors.grey,
//                         fontWeight: FontWeight.w300,
//                         fontSize: 14),
//                   ),
//                 ],
//               ),
//               const YMargin(20),
//               submitButton(),
//               const YMargin(20),
//             ]),
//           ),
//         ));
//   }

//   void getData() async {
//     if (widget.amount != null)
//       setState(() {
//         amountTEC.text = (widget.amount * 10).toString();
//       });
//     profile = await persistence.getProfileDetailData();
//   }

//   Future<void> _validateCard(value) async {
//     var number;

//     if (value.length == 6) {
//       number = numberC.text.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
//       try {
//         var response = await PaystackVerifyCard.verifyCard(number, context);
//      //   print(response);

//         await new Future.delayed(const Duration(seconds: 5));

//         setState(() {
//           isCardValid = PaystackVerifyCard.isValid;
//           String card = PaystackVerifyCard.cardType.toLowerCase();

//           if (card.contains('master')) {
//             icon = 'mastercard';
//           } else if (card.contains('visa')) {
//             icon = 'visa';
//           } else if (card.contains('america')) {
//             icon = 'amex';
//           } else if (card.contains('discover')) {
//             icon = 'discover';
//           } else if (card.contains('verve')) {
//             icon = 'verve';
//           }
//         });
//       } catch (e) {
//         // Handle error...
//       }

//       //print(number);
//     } else if (value.length > 6 && isCardValid) {
//       setState(() {
//         number = numberC.text.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
//       });
//     } else if (value.length > 8 && isCardValid) {
//       setState(() {
//         last4 = numberC.text.substring(numberC.text.length - 4);
//         //print(number);
//       });
//     }
//   }

//   Widget submitButton() => !isLoading
//       ? Button.button("Continue Payment", payWithCard, Color(0xFF2e3a8e))
//       : SpinKitChasingDots(color: Color(0xFF2e3a8e));

//   payWithCard() async {
//     try {
//       if (numberC.text.isNotEmpty &&
//           isCardValid &&
//           _formKey.currentState.validate()) {
//         _formKey.currentState.save();
      
//       } else {}
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   paystackPayWithCard() => ButtonTheme(
//         minWidth: 300.0,
//         height: 50.0,
//         child: RaisedButton(
//           onPressed: () => payWithCard(),
//           color: Theme.of(context).accentColor,
//           textColor: Colors.white,
//           child: Text('FUND ACCOUNT'),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//         ),
//       );

//   
//   _buildAmount({@required hint}) {
//     return Theme(
//         data: ThemeData(
//           primaryColor: Colors.grey[400],
//           accentColor: Colors.grey[400],
//         ),
//         child: Padding(
//             padding: const EdgeInsets.only(left: 0.0, right: 0, bottom: 18.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text('Amount to Fund',
//                     style:
//                         TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
//                 const YMargin(10),
//                 TextField(
//                   controller: amountTEC,
//                   enabled: widget.amount == null,
//                   //textAlign: TextAlign.center,
//                   decoration: InputDecoration(
//                       contentPadding: EdgeInsets.all(18.0),
//                       filled: true,
//                       prefixText: '₦ ',
//                       fillColor: Colors.blue.withOpacity(0.04),
//                       border: OutlineInputBorder(),
//                       hintText: hint),
//                   keyboardType: TextInputType.text,
//                 ),
//               ],
//             )));
//   }
// }

// class BuildCard extends StatefulWidget {
//   const BuildCard({Key key}) : super(key: key);

//   @override
//   _BuildCardState createState() => _BuildCardState();
// }

// class _BuildCardState extends State<BuildCard> {
//   TextEditingController numberC = new TextEditingController();
//   var icon = '';

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: screenHeight(context, percent: 0.26),
//       width: screenWidth(context, percent: 0.9),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             new BoxShadow(
//               offset: Offset(6, 20),
//               spreadRadius: -17,
//               color: Colors.black.withOpacity(0.5),
//               blurRadius: 14,
//             ),
//           ],
//           gradient: LinearGradient(
//               begin: Alignment.bottomRight,
//               end: Alignment.topLeft,
//               colors: [Color(0xFF2e3a8e), Colors.pink])),
//       child: Center(
//         child: Stack(
//           children: <Widget>[
//             /*  Positioned.fill(
//               top: 108,
//               left: 200,
//               bottom: 0,
//               child: Opacity(
//                 opacity: 0.3,
//                 child: Container(
//                   alignment: Alignment.bottomRight,
//                   decoration: BoxDecoration(
//                       image: DecorationImage(
//                           fit: BoxFit.fitHeight,
//                           image: AssetImage('visa.png'))),
//                 ),
//               ),
//             ),
//             */
//             Positioned.fill(
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//                     const YMargin(10),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 18.0),
//                       child: Text('XXXX XXXX XXXX $last4',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16.5,
//                               fontWeight: FontWeight.w400)),
//                     ),
//                     const YMargin(40),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Padding(
//                           padding: const EdgeInsets.only(left: 18.0),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Text('CARD HOLDER',
//                                   style: TextStyle(
//                                       color: Colors.white54,
//                                       fontSize: 10.5,
//                                       fontWeight: FontWeight.w200)),
//                               const YMargin(20),
//                               Container(
//                                 width: 100,
//                                 height: 30,
//                                 child: FittedBox(
//                                   fit: BoxFit.fitHeight,
//                                   child: Text(
//                                       "${nameC.text.split(' ')[0]}" +
//                                           '\n' +
//                                           "${nameC.text.split(' ').length > 1 ? nameC.text.split(' ')[1] : ''}",
//                                       style: TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 10,
//                                           fontWeight: FontWeight.w400)),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const YMargin(50),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 18.0),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Text('EXPIRES',
//                                   style: TextStyle(
//                                       color: Colors.white54,
//                                       fontSize: 10.5,
//                                       fontWeight: FontWeight.w200)),
//                               const YMargin(20),
//                               Text('${valid.text}',
//                                   style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w400)),
//                             ],
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
