//Tonal Porject By Sathvik Konuganti
//Date: 06/28/2022
import 'dart:core';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tonal_troject_konuganti/styles.dart';
import 'package:auto_size_text/auto_size_text.dart';

class StrengthForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StrengthFormState();
  }
}

class StrengthFormState extends State<StrengthForm>{
  final  _weightController = TextEditingController();
  final _labelController = TextEditingController();
  String _label="";
  String _weight="";

  final _formKey = GlobalKey<FormState>();
  final _labelKey = GlobalKey<FormState>();

  void onTap(){ //Validation for both inputs
    if(_formKey.currentState!.validate()){
      setState((){
        _weight = _weightController.text;
      });
    }else{
      return null;
    }
    if(_labelKey.currentState!.validate()){
      setState((){
        _label = _labelController.text;
      });
    }else{
      return null;
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Strength Form")),
      body: Container(
        child: Stack(
          children: [
            Container(
              width: 550,
              height: 350,
              decoration: bubbleBoxDecoration,
            ),
            Container(
              padding: EdgeInsets.all(50),
              alignment: Alignment.topCenter,
              child: Text(
                _label,
                textAlign: TextAlign.center,
                style: labelTextStyle,
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(80, 70, 80, 400),
              alignment: Alignment.topCenter,
              child: AutoSizeText( //Automatically resize text
                _weight,
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
                FocusManager.instance.primaryFocus?.unfocus(); //Allows the keyboard to go down after typing.
              },
              child: SingleChildScrollView(

                child: Container(
                  padding: EdgeInsets.only(top:390),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                    controller: _weightController,
                    keyboardType: TextInputType.numberWithOptions(),
                    decoration: InputDecoration(labelText: 'Weight'),
                    validator: (val){
                      if(val!.isEmpty){
                        return "Please enter a value";
                      }
                      int weight = int.parse(val); //Converting string to int for weight range.
                      if(weight < 0 || weight > 350){ //Making sure input is within the weight range.
                        return "Please enter a value between 0-350lbs";
                      }
                    },
                  ),
                  ),

                ),

              ),
            ),
            GestureDetector(
              onTap: (){
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Container( //This container holds the label of the Strength widget.
                padding: EdgeInsets.only(top:470),
                child: Form(
                  key: _labelKey,
                  child: TextFormField(
                    controller: _labelController,
                    decoration: InputDecoration(labelText: 'Strength Label'),
                    validator: (val){
                      if(val!.isEmpty){
                        return "Please enter a label name";
                      }

                    },
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
                padding: EdgeInsets.only(top:500),
              child: ElevatedButton(
                onPressed: onTap,
                child: Text("Submit")
              ),

            )

          ],
        ),

      ),
    );

  }

}






