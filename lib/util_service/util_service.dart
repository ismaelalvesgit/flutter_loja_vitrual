import 'dart:io';
import 'package:flutter/material.dart';

//@Author Ismael Alves
class UtilServices{

  static Future<bool> onBackPressed(BuildContext context){
    return showDialog(
      context: context,
      builder: (context)=> AlertDialog(
        title: Text("Tem certeza que deseja sair do app",
          style: TextStyle(
            fontSize: 15.0,
            fontFamily: "Roboto"
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.pop(context,false);
            },
            child: Text("Não",
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: "Roboto",
                color: Colors.black,
              ),
            ),

          ),
          FlatButton(
            onPressed: (){
              exit(0);
            },
            child: Text("Sim",
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: "Roboto",
                color: Colors.red,
              ),
            ),

          )
        ],
      )
    );
  }
}
