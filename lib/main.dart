import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Widgets/InputBoxWidget.dart';
import 'Models/LoginFormModel.dart';

void main() => runApp(LettersLogInPage());

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
                  ChangeNotifierProvider(
                    create: (context) => LoginForm(),
                    child: InputBoxWidget(
                      labelText: "Username",
                      padding: 10 
                    ),
                  ),
                InputBoxWidget(labelText: "Password", padding: 10 ),

              ],
            ),
          ),
        );
      }
    );
  }
}