import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      width: 90,
      child: LinearProgressIndicator(
        backgroundColor: Colors.grey[100],
      ),
    );
  }
}

class CircleLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 45,
          width: 45,
          child: CircularProgressIndicator(
            backgroundColor: Colors.grey[100],
          ),
        ),
      ],
    );
  }
}
