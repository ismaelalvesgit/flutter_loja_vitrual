import 'package:flutter/material.dart';
import 'package:loja_virtual/pages/index_page.dart';

class DrawerTile extends StatelessWidget {

  final IconData icon;
  final String text;
  final PageController controller;
  final int page;

  DrawerTile([this.icon, this.text, this.controller, this.page]);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.of(context).pop();
          if(page == 99){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> IndexPage(produtos: false,)));
          }else{
            controller.jumpToPage(page);
          }
        },
        child: Container(
          height: 50.0,
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                size: 25.0,
                color: controller.page.round() == page ?
                Theme.of(context).primaryColor : Colors.grey[700],
              ),
              SizedBox(width: 10.0,),
              Text(
                text,
                style: TextStyle(
                  fontSize: 18.0,
                  color: controller.page.round() == page ?
                  Theme.of(context).primaryColor : Colors.grey[700],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
