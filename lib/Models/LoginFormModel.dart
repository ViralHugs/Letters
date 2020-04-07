import 'package:flutter/material.dart';

// This model should only be used for the login input 
// and output. It should only be called in the LoginPage.dart 
// Widget 


class LoginForm with ChangeNotifier {
  String _username = ''; 
  String _password = '';

  String get getUsename => _username; 
  String get getPassword => _password; 

  set setUsername(String username) => _username = username; 
  set setPassword(String password) => _password = password;



}

