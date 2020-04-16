import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailPasswordForm extends StatefulWidget {

  final loginOrRegister;
  
  // constructor
  EmailPasswordForm(this.loginOrRegister);

  @override
  State<StatefulWidget> createState() {
    return _EmailPasswordFormState(this.loginOrRegister);    
  }
}

class _EmailPasswordFormState extends State<EmailPasswordForm>
{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final bool loginOrRegister; // true -> login ; false -> register

  bool _success;

  // Constructor 
  _EmailPasswordFormState(this.loginOrRegister);

  void _processUser(FirebaseAuth _auth, String username, String password, bool loginOrRegister) async { 
    // Processes the user for auth using the username and password inputed by the form. 
    //  
    //
    //
    //

    FirebaseUser user;

    try { 
      if( !loginOrRegister )
      {
        user = (await _auth.createUserWithEmailAndPassword(
            email: username, 
            password: password
          ))
          .user;
      }
      else {
        user = (await _auth.signInWithEmailAndPassword(
          email: username,
          password: password,
        ))
        .user;
      }
    } on Exception catch(err) {
      user = null;
    }

    if(user != null) {
      setState((){
        _success = true; 
      });
    }
    else {
      setState((){
        _success = false; 
      });
    }
  }

  Container _createLoginInputField({TextEditingController controller, String labelText}) {
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

    final _usernameController = TextEditingController();
    final _passwordController = TextEditingController();

    return LayoutBuilder(
      builder: (context, constraints) {

        final maxWidth = constraints.maxWidth;

        final maxHeight = constraints.maxHeight;

        return GestureDetector(
          onTap: () => {
            
            if(_success) {
              Navigator.pop(context)
            }
            
          },

          child: MaterialApp(
          
            home: Scaffold(

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

                Form(
                  
                  key: _formKey,

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
                          onPressed: (){
                            if(_formKey.currentState.validate()){
                              _processUser(_auth, _usernameController.text, _passwordController.text, loginOrRegister);
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

                      Container(
                        child: Text(_success == null 
                        ? ''
                        : (_success 
                            ? 'Sucessfully processed'
                            : 'Failed to process')
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              ),
            ),
          ),
        );
      }
    );
  }

}