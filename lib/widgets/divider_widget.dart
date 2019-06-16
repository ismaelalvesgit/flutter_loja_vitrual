import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DividerWidget extends StatelessWidget {

  double top;
  double bottom;
  double left;
  double right;

  DividerWidget({this.top, this.bottom, this.left, this.right});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 1.0,
      color: Colors.grey[300],
      margin: EdgeInsets.only(
        top: top != null ? top : 0.0,
        bottom: bottom != null ? bottom : 0.0,
        left: left != null ? left : 0.0,
        right: right != null ? right : 0.0
      ),
    );
  }
}
