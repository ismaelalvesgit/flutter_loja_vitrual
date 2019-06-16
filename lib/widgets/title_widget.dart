import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {

  String text;

  TitleWidget(this.text);

  @override
  Widget build(BuildContext context) {

    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10.0),
          child: Text("|",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700]
            ),
          ),
        ),
        Text(text,
          style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 20.0,
              color: Colors.grey
          ),
        )
      ],
    );
  }
}
