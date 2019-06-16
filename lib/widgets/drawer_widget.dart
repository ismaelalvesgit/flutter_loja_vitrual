import 'package:loja_virtual/widgets/divider_widget.dart';
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
  
  Widget _widgetRole(bool isRole){
   return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          DrawerTile(Icons.home, "Destaques", pageController, 0),
          DrawerTile(Icons.list, "Departamentos", pageController, 1),
          DrawerTile(Icons.favorite_border, "Favoritos", pageController, 2),
          DrawerTile(Icons.shopping_basket, "Meus Pedidos", pageController, 3),
          DrawerTile(Icons.loyalty, "Meus Vales", pageController, 4),
          DrawerTile(Icons.monetization_on, "Aqui tem Desconto", pageController, 5),
          DividerWidget(top: 10.0),
          Container(
            height: 20.0,
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 20.0, bottom: 10.0),
            child: InkWell(
              onTap: () {},
              child: Text(
                "Atendimento pelo Telefone",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18.0,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
          Container(
            height: 20.0,
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: InkWell(
              onTap: () {},
              child: Text(
                "Compre pelo telefone",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18.0,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
          Container(
            height: 20.0,
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: InkWell(
              onTap: () {},
              child: Text(
                "Regras descontos na loja",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18.0,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
          Container(
            height: 20.0,
            width: double.maxFinite,
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: InkWell(
              onTap: () {},
              child: Text(
                "Sobre o App",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18.0,
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  // ignore: non_constant_identifier_names
  Widget _widgetBackgroundMenu() => Container(
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
              _widgetBackgroundMenu(),
             Positioned(
                top: 0.0,
                right: 0.0,
                child: IconButton(
                  icon:Icon(Icons.settings, color: Colors.white,),
                  onPressed: null
                )
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                 Column(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: <Widget>[
                     Container(
                       height: 100.0,
                       width: 100.0,
                       decoration: BoxDecoration(
                           image: DecorationImage(image: AssetImage("images/user.png"))
                       ),
                     ),
                     Text("Ismael Alves Ximenes Bezerra",
                       textAlign: TextAlign.center,
                       style: TextStyle(
                           fontFamily: "Roboto",
                           fontSize: 18.0,
                           color: Colors.white
                       ),
                     ),
                     SizedBox(height: 10.0,)
                   ],
                 )
               ],
             )
            ],
          ),
        ),
        _widgetRole(isRole)
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


