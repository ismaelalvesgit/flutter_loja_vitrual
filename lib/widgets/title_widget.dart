import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TitleWidget extends StatelessWidget {

  String text;
  double fontSize;
  double marginTop;
  double marginBottom;
  double marginRight;
  double marginLeft;

  TitleWidget({@required this.text, this.fontSize, this.marginTop, this.marginBottom, this.marginLeft, this.marginRight});

  @override
  Widget build(BuildContext context) {

    return  Container(
      margin: EdgeInsets.only(
        top: marginTop != null ? marginTop : 0.0,
        bottom: marginBottom != null ? marginBottom : 0.0,
        left: marginLeft != null ? marginLeft : 0.0,
        right: marginRight != null ? marginRight : 0.0
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text("|",
              style: TextStyle(
                  fontSize: fontSize != null ? fontSize-2.0 : 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[700]
              ),
            ),
          ),
          Text(text,
            style: TextStyle(
                fontFamily: "Roboto",
                fontSize: fontSize != null ? fontSize : 20.0,
                color: Colors.grey
            ),
          )
        ],
      ),
    );
  }
}
