import 'package:flutter/material.dart';

//@Author Ismael Alves
class CardNoDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Card(
          margin: EdgeInsets.all(10.0),
          elevation: 0.0,
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.info,
                  color: Colors.amberAccent,
                  size: 60.0,
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  height: 50.0,
                  width: 1.0,
                  color: Colors.grey[300],
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.red),
                            borderRadius: BorderRadius.circular(3.0)),
                        child: Text(
                          "Ops...",
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: "Roboto",
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      Text(
                        "Nenhuma atividade disponível",
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: "Roboto",
                            fontSize: 15.0),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
