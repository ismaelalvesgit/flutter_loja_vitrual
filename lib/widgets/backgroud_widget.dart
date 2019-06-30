import 'package:flutter/material.dart';

//@Author Ismael Alves
class BackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.white,
          Colors.grey[100]
        ],
        begin: AlignmentDirectional.topCenter,
        end: AlignmentDirectional.bottomCenter
        )
      ),
    );
  }
}
