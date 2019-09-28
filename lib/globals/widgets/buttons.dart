import 'package:checkout/globals/utils/margin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({
    Key key,
    @required this.onTap,
    this.logo = 'paystack',
    this.color = Colors.green,
    this.scale,
    this.width,
  }) : super(key: key);

  final VoidCallback onTap;
  final String logo;
  final Color color;
  final double scale;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 10),
      child: Container(
        height: 55,
        width: width,
        child: CupertinoButton(
          child: Image.asset('assets/logos/$logo.png', scale: scale ?? 4),
          onPressed: this.onTap,
          color: color,
          pressedOpacity: 0.3,
        ),
      ),
    );
  }
}

class TextButton extends StatelessWidget {
  const TextButton(
      {Key key,
      @required this.onTap,
      this.text = 'Continue',
      this.color,
      this.width})
      : super(key: key);

  final VoidCallback onTap;
  final String text;
  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(38.0),
      child: Container(
        width: width ?? screenWidth(context),
        child: CupertinoButton(
          child: Text(
            '$text',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: this.onTap,
          color: color ?? Theme.of(context).accentColor,
          pressedOpacity: 0.3,
        ),
      ),
    );
  }
}
