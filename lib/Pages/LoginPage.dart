import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LettersLogInPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {

    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    return LayoutBuilder(
      builder: (context, constraints) {

        final maxWidth = constraints.maxWidth;

        final maxHeight = constraints.maxHeight;

        return ListView(
          children: <Widget>[

            Container(
              padding: EdgeInsets.all(maxHeight / 30),
              child: Image.asset(
                "images/placeholder.png", 
                width: maxWidth / 5, 
                height: maxHeight / 5,
              ),
            ),

            Form(
              child: Column(
                children: <Widget>[
                  _createLoginInputField(
                    controller: _usernameController, 
                    labelText: "Username"
                  ),
                  _createLoginInputField(
                    controller: _passwordController, 
                    labelText: "Password"
                  ),

                  Container(
                    padding: EdgeInsets.all(45),
                    child: RaisedButton(
                      // TODO: MAKE HTTP REQUEST HERE GIVEN THE VALUES
                      onPressed: (){
                       if(_formKey.currentState.validate()){
                         _registerUser(_auth, _usernameController.text, _passwordController.text);
                       }
                      },
                      child: Center(
                        child: Text("Sign In")
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23), 
                        side: BorderSide(color: Colors.pink[100]),
                      ), 
                      color: Colors.pink[100],
                    )
                  ),
                ],
              ),
            ),
          ],
        );
      }
    );
  }
}

// TODO: finish this function
void _registerUser(FirebaseAuth _auth, String username, String password) async { 
  final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: username,
      password: password,
    ))
        .user;
  //   if (user != null) {
  //     setState(() {
  //       _success = true;
  //       _userEmail = user.email;
  //     });
  //   } else {
  //     _success = false;
  //   }
  // }

}

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