import 'dart:core';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tonal_troject_konuganti/styles.dart';

class StrengthForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StrengthFormState();
  }
}

class StrengthFormState extends State<StrengthForm>{
  late int upperInt = 0;
  late int coreInt;
  late int lowerInt;
  late String upper;
  late String core;
  late String lower;


  final _formKey = GlobalKey<FormState>();
  
  Widget _buildCoreField(){
    return Column(
      children: [
        TextFormField(
          key: _formKey,
          keyboardType: TextInputType.numberWithOptions(),
          decoration: InputDecoration(
              labelText: "Upper Weight"
          ),
          validator: (value){
            if(value!.isEmpty){
              return "Weight is required";
            }
            upperInt = int.parse(value);
            if(upperInt < 0 || upperInt > 350){ //weight constraints
              return "Please enter a weight between 0-350";
            }
          },

        ),
        Container(
          child: ElevatedButton(
            onPressed: (){
              if(_formKey.currentState!.validate()){
                return;
              }
            },
            child: Text("Button"),
          ),
        )
      ],
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Strength Form")),
      body: Container(
        child: Stack(
          children: [
            Container(
              width: 530,
              height: 320,
              decoration: bubbleBoxDecoration,
            ),
            Container(
              padding: EdgeInsets.all(50),
              alignment: Alignment.topCenter,
              child: Text(
                "Upper Body",
                textAlign: TextAlign.center,
                style: labelTextStyle,
              ),
            ),
            Container(
              padding: EdgeInsets.all(80),
              alignment: Alignment.topCenter,
              child: Text(
                "${upperInt}",
                textAlign: TextAlign.center,
                style: weightTextStyle,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 220),
              alignment: Alignment.topCenter,
              child: Text(
                "lbs",
                textAlign: TextAlign.center,
                style: unitTextStyle,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 170, 0, 300),
                alignment: Alignment.topCenter,
              child: SvgPicture.asset("assets/graph.svg"),
            ),
            GestureDetector(
              onTap: (){
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(top:390),
                    child: _buildCoreField(),
                  ),

              )
            ),

          ],
        ),


      ),
    );

  }

}

mixin InputValidationMixin{
  bool isWeigthValid(String weight){

  }
}

