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
                  fontFamily: "Roboto"
              ),
            )
          ),
          FlatButton(
            onPressed: (){
              exit(0);
            },
            child: Text("Sim",
              style: TextStyle(
                fontSize: 15.0,
                fontFamily: "Roboto"
              ),
            )
          )
        ],
      )
    );
  }

/*
   static Future<bool> onBackPressed(BuildContext context) {
    showModalBottomSheet<bool>(context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          child: Padding(
            padding: EdgeInsets.only(top: 10.0, bottom:10.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 20.0,),
                Icon(FontAwesomeIcons.signOutAlt, color: Colors.grey[700]),
                SizedBox(width: 20.0,),
                Text("Clique mais uma vez para sair.",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "Roboto",
                    color: Colors.grey[700]
                  ),
                ),

              ],
            ),
          ),
            onWillPop: ()=>_exitApp(context)
        );
      }
    );

    Future.delayed(Duration(seconds: 3)).then((_){
      Navigator.pop(context);
    });

    return Future.value(false);
  }

   static Future<bool> _exitApp(BuildContext context){
      exit(0);
      return Future.value(true);
  }

  */


}
