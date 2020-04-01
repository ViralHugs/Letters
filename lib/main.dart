import 'package:flutter/material.dart';

void main() => runApp(LettersLogInPage());

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

    return 
      LayoutBuilder(
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

class LettersLogInPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {

        final maxWidth = constraints.maxWidth;

        final maxHeight = constraints.maxHeight;

        return MaterialApp(
          
          title: "Letters Log In Page",
          
          home: Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text("Letters Log In Page"),
              )
            ),

            body: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(maxHeight / 30),
                  
                  child: Image.asset(
                      "images/placeholder.png", 
                      width: maxWidth / 5, 
                      height: maxHeight / 5,
                    ),
                  ),

                  TextForm(),

              ],
            ),

          ),
        );
      }
    );

  }
}