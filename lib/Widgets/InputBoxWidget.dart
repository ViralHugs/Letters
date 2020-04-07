import 'package:flutter/material.dart';

class InputBoxWidget extends StatefulWidget{

  final String labelText;
  final double padding; // TODO: ...may have to change this later if we need other formatting for our InputBoxes

  InputBoxWidget({this.labelText, this.padding});

  @override
  State<StatefulWidget> createState() {
    return _InputBoxWidgetState(labelText, padding); 
  } // createState

} // InputBoxWidget

class _InputBoxWidgetState extends State<InputBoxWidget> {
  
  final _formKey = GlobalKey<FormState>();
  String labelText = '';
  double padding = 0.0;
  _InputBoxWidgetState(this.labelText, this.padding);

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(this.padding),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: labelText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  } // build

}

