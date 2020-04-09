import 'package:flutter/material.dart';
import 'package:letters_2020_0/Pages/LoginPage.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Letters Log In Page",
          
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Letters Log In Page"),
          )
        ),
        resizeToAvoidBottomPadding: false,
        body: LettersLogInPage()
      )
    );
  }
}