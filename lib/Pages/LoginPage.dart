import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:letters_2020_0/Pages/RegisterPage.dart';

class LettersLogInPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  
  Container _createLoginInputField({TextEditingController controller, String labelText}){
    return Container(
      padding: EdgeInsets.all(23),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
        validator: (String text){
          if(text.isEmpty){
            return("Please enter some text");
          }
          return null;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child:ListView(children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => EmailPasswordForm(false)),
              );
            },
            child: Text("Register"),
          ),

          RaisedButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder: (context) => EmailPasswordForm(true)),
              );
            },
            child: Text("Login"),
          ),
        ],
      ),
    );
  }
}