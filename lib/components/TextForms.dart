import 'package:flutter/material.dart';

// TODO: Make widgets more general. Remove hard coded numbers

Container createTextBox(String labelText){

  return(
    Container(

      padding: EdgeInsets.symmetric(horizontal:50),

      child: TextFormField( 
        
        decoration: InputDecoration(
          labelText: labelText
        ),

        validator: (value) {
          if(value.isEmpty){
            return 'Please enter some text';
          }
          return null;
        },
      ),

    )
  );
}


class TextForm extends StatefulWidget {

  @override 
  _TextForm createState() {
    return _TextForm();
  }

}

class _TextForm extends State<TextForm> {

  // Code taken form: https://flutter.dev/docs/cookbook/forms/validation
  final _formKey = GlobalKey<FormState>(); 
  
  _TextForm();

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {

        final maxWidth = constraints.maxWidth;

        final maxHeight = constraints.maxHeight;

        return Form(

          key: _formKey,
          
          child: Column( 

            children: <Widget>[

              createTextBox("Enter Username"),

              createTextBox("Enter Password"),

              Container( 
                padding: EdgeInsets.only(left: maxWidth/20, top:maxWidth/20),

                child: Align(
                  
                  alignment: Alignment.bottomLeft,

                  child: RaisedButton(
                    onPressed: (){ 
                      if(_formKey.currentState.validate()) {

                        Scaffold
                          .of(context)
                          .showSnackBar(SnackBar(content: Text('Processing Data')));
                      }
                    },

                    child: Text("Submit"),
                 
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}