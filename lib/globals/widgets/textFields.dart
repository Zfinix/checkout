import 'package:checkout/globals/utils/validator.dart';
import 'package:checkout/modules/paystack/providers/checkoutProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Email extends StatelessWidget {
  final CheckoutProvider controller;
  const Email(this.controller, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.amber[500].withOpacity(0.16),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 60,
      child: TextFormField(
        validator: (value) {
          if (isEmail(value)) {
            controller.emailC.text = value;
            return null;
          } else if (value.isEmpty) {
            return "This field can't be left empty";
          } else {
            return "Email is Invalid";
          }
        },
        style: TextStyle(fontSize: 14, color: Colors.grey[800]),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
            labelStyle: TextStyle(fontSize: 16, color: Colors.grey[600]),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.email,
              color: Colors.green,
            ),
            labelText: 'Email'),
        keyboardType: TextInputType.text,
      ),
    );
  }
}

class CardNumber extends StatelessWidget {
  final validateCard;
  final CheckoutProvider controller;
  const CardNumber(this.controller, {Key key, this.validateCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.amber[500].withOpacity(0.16),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly,
          BlacklistingTextInputFormatter.singleLineFormatter,
          CreditCardTextInputFormatter(),
          LengthLimitingTextInputFormatter(23),
        ],
        onChanged: (value) async {
          if (value.isNotEmpty) {
            var cursorPos = controller.numberC.selection;

            if (cursorPos.start > controller.numberC.text.length) {
              cursorPos = new TextSelection.fromPosition(
                  new TextPosition(offset: controller.numberC.text.length));
            }
            controller.numberC.text = value?.trim() ?? '';
            controller.number = value;
            controller.numberC.selection = cursorPos;

            if (value.length == 6) {
              await validateCard(value);
            }
            return null;
          } else if (value.isEmpty) {
            return "This field can't be left empty";
          } else {
            return "Card Number is Invalid";
          }
        },
        maxLines: null,
        style: TextStyle(fontSize: 14, color: Colors.grey[800]),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
            labelStyle: TextStyle(fontSize: 16, color: Colors.grey[600]),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.credit_card,
              color: Colors.green,
            ),
            suffixIcon: controller.isCardValid
                ? Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                : Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ),
            labelText: 'Card Number'),
        keyboardType: TextInputType.text,
      ),
    );
  }
}

class Valid extends StatelessWidget {
  final text;
  final TextEditingController tec;
  final CheckoutProvider controller;
  const Valid(this.controller, {Key key, this.text, this.tec})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.369,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.amber[500].withOpacity(0.16),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        onChanged: (value) {
          if (value.isNotEmpty) {
            controller.valid.text = value;
            controller.validity = value;
            return null;
          } else if (value.isEmpty) {
            return "This field can't be left empty";
          } else {
            return "Valid thru on Card is Invalid";
          }
        },
        controller: tec,
        style: TextStyle(fontSize: 14, color: Colors.grey[800]),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
            labelStyle: TextStyle(fontSize: 16, color: Colors.grey[600]),
            border: InputBorder.none,
            hintText: 'MM/YY',
            labelText: 'Valid thru'),
        keyboardType: TextInputType.numberWithOptions(signed: true),
      ),
    );
  }
}

class CVV extends StatelessWidget {
  final text;
  final CheckoutProvider controller;
  const CVV(this.controller, {Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.369,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.amber[500].withOpacity(0.16),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: TextFormField(
        validator: (value) {
          if (value.isNotEmpty) {
            controller.cvvC.text = value;
            return null;
          } else if (value.isEmpty) {
            return "This field can't be left empty";
          } else {
            return "CVV on Card is Invalid";
          }
        },
        obscureText: true,
        style: TextStyle(fontSize: 14, color: Colors.grey[800]),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
            labelStyle: TextStyle(fontSize: 16, color: Colors.grey[600]),
            border: InputBorder.none,
            labelText: 'CVV'),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class PIN extends StatelessWidget {
  final text;
  final controller;
  const PIN(this.controller, {Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.amber[500].withOpacity(0.16),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: TextFormField(
        validator: (value) {
          if (value.isNotEmpty) {
            controller.pin.text = value;
            return null;
          } else if (value.isEmpty) {
            return "This field can't be left empty";
          } else {
            return "PIN is Invalid";
          }
        },
        obscureText: true,
        style: TextStyle(fontSize: 14, color: Colors.grey[800]),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
            labelStyle: TextStyle(fontSize: 16, color: Colors.grey[600]),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.lock,
              color: Colors.green,
            ),
            labelText: 'PIN'),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class CreditCardTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = StringBuffer();

    if (newTextLength >= 4) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 4) + ' ');
      if (newValue.selection.end >= 4) selectionIndex += 2;
    }
    if (newTextLength >= 8) {
      newText.write(newValue.text.substring(4, usedSubstringIndex = 8) + ' ');
      if (newValue.selection.end >= 8) selectionIndex += 2;
    }
    if (newTextLength >= 12) {
      newText.write(newValue.text.substring(8, usedSubstringIndex = 12) + ' ');
      if (newValue.selection.end >= 12) selectionIndex += 2;
    }
    if (newTextLength >= 16) {
      newText.write(newValue.text.substring(12, usedSubstringIndex = 16) + ' ');
      if (newValue.selection.end >= 16) selectionIndex += 2;
    }

    if (newTextLength >= 20) {
      newText.write(newValue.text.substring(16, usedSubstringIndex = 20) + '');
      if (newValue.selection.end >= 20) selectionIndex += 2;
    }

    // Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
