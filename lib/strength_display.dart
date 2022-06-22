import 'package:flutter/material.dart';

class StrengthDisplay extends StatefulWidget{
  final int weight;
  StrengthDisplay({required Key key, required this.weight}) : super (key: key);
  @override
  _StrengthDisplayState createState() => new _StrengthDisplayState();

}

class _StrengthDisplayState extends State<StrengthDisplay>{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Strength Results"),
      ),
      body: new Text("${widget.weight}"),
    );
  }

}