import 'package:flutter/material.dart';

// this model will be used to transfer data between widgets
// it will contain a dictionary that the user can use to store what they need at the 
// time under a unique key value

class DataTransferModel with ChangeNotifier {
  var data = Map();

  void store(var key, var value){
    data[key] = value;
  }

  void appendToListValue(var key, var value){
    if(data[key] is List){
      data[key].add(value);
    }
    else{
      throw new FormatException();
    }
  }

  get({key}) => data[key];
  
}

