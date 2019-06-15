import 'package:loja_virtual/widgets/drawer_tile.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {

  final PageController pageController;

  DrawerWidget(this.pageController);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState(this.pageController);
}

class _DrawerWidgetState extends State<DrawerWidget> {

  final PageController pageController;

  bool isRole;

  @override
  void initState() {
    super.initState();

  }

  _DrawerWidgetState(this.pageController);

  Widget _buildDrawerBack() => Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 203, 236, 241),
              Colors.white
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        )
    ),
  );
  
  Widget _widget_Role(bool isRole){

   return isRole != false ? Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

        ],
      ),
    ): Container(
     margin: EdgeInsets.all(10.0),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[

       ],
     ),
   );

  }
  
  Widget _widget_background_menu() => Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage("images/backgroun-menu.jpg"),
          fit: BoxFit.cover
      ),
    ),
  );

  Widget _drawer() {
    return Column(
      children: <Widget>[
        Container(
          width: double.maxFinite,
          height: 190.0,
          child: Stack(
            children: <Widget>[
              _widget_background_menu(),
              Container(
                margin: EdgeInsets.only(top: 30.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        image:  DecorationImage(
                            image: AssetImage("images/user.png"))
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Expanded(
                      child: Text("Ismael alves",
                        style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.white,
                          fontSize: 20.0
                        ),
                      )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        _widget_Role(isRole)
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView.builder(
            itemCount: 1,
            itemBuilder: (context , index){
              return _drawer();
            },
          )
        ],
      ),
    );
  }
}


