import 'package:flutter/material.dart';
import 'package:tonal_troject_konuganti/strength_form.dart';
import 'styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'widgets/strength_widget.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: StrengthForm(),
    );
  }
}


