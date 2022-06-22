import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StrengthWidget extends StatelessWidget {
  const StrengthWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(100.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle
      ),
    );
  }
}
