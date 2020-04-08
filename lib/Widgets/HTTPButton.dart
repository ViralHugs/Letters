import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/DataTransferModel.dart';

// Button that sends some sort of request 
// Designed to interact with the DataTransferModel in some way

//TODO: Move to theme when appropreate

class HTTPButton extends StatelessWidget {

  final String buttonLabel;

  // EdgeInset.all padding. 
  final double padding;

  final toRecieve;

  HTTPButton({this.buttonLabel ,this.padding=0, List<String> this.toRecieve}); 

  @override
  Widget build(BuildContext context) {
    final dataTransferModel = Provider.of<DataTransferModel>(context, listen: false);

    return Container(
      
      padding: EdgeInsets.all(padding),
      
      child: RaisedButton(
        
        // TODO: MAKE HTTP REQUEST HERE GIVEN THE VALUES
        onPressed: (){

          for(var key in toRecieve){
            print(dataTransferModel.get(key: key));
          }

        },
        child: Center(
          child: Text(buttonLabel)
        ),
          
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(23), 
          side: BorderSide(color: Colors.pink[100]),
        ), 

        color: Colors.pink[100],

      )
    );
  }
}