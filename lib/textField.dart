import 'dart:ffi';

import 'package:flutter/material.dart';

class textField extends StatefulWidget {
  const textField({Key? key}) : super(key: key);

  @override
  State<textField> createState() => _textFieldState();
}

class _textFieldState extends State<textField> {

  TextEditingController _textEditingControllergas = TextEditingController();
  TextEditingController _textEditingControlleretha = TextEditingController();
  String _resultText = "";

  void _calculate(){

    var ethaPrice = double.tryParse(_textEditingControlleretha.text);
    var gasPrice = double.tryParse(_textEditingControllergas.text);

    if( ethaPrice == null || gasPrice == null ){
      setState(() {
        _resultText = "null price";
      });
    }else{
      if( (ethaPrice/gasPrice) >= 0.7){
        setState(() {
          _resultText = "Fill with gasoline";
        });
      }else{
        setState(() {
          _resultText = "Fill with ethanol";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gasoline vs. Ethanol"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(bottom: 32)),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Fill in the gasoline price:"
                  ),
                  enabled: true,
                  maxLength: 6,
                  obscureText: false,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  onSubmitted: (String e) {

                  },
                  controller: _textEditingControllergas,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Fill in the ethanol price:"
                  ),
                  enabled: true,
                  maxLength: 6,
                  obscureText: false,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                  onSubmitted: (String e) {

                  },
                  controller: _textEditingControlleretha,
                ),
                ElevatedButton(
                    child: Text("Calculate",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: _calculate
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(_resultText,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}