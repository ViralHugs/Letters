import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

  // TODO: finish this function
  void _registerUser(FirebaseAuth _auth, String username, String password) async { 
    print("nothing");
  }

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
                      // TODO: MAKE HTTP REQUEST HERE GIVEN THE VALUES
                      onPressed: (){
                       if(_formKey.currentState.validate()){
                          showDialog(context: context, 
                            barrierDismissible: false,
                            builder: (_) => PopInOverlay(),
                          );
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

class PopInOverlay extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _PopInOverlayState();
  }
  
}

class _PopInOverlayState extends State<PopInOverlay> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation<double> scaleAnimation;
  
  @override void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {

        final double maxHeight = constraints.maxHeight;
        return Center(
          child:  Container ( 
            child: ScaleTransition( 
              scale: scaleAnimation,
              child: 
              Container( 
                color: Colors.pink[100].withOpacity(.75),
                width: maxHeight / 3,
                height: maxHeight / 3,
                child: SpinKitFadingCircle(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.red : Colors.green,
                      ),
                    );
                  },
                ),
              )
            )
          )    
        );
      }
    );
  }
}
