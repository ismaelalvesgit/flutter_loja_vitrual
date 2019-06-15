import 'package:flutter/material.dart';
import 'package:loja_virtual/util_service/util_service.dart';
import 'package:loja_virtual/widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  final PageController pageController;

  const HomePage({Key key, this.pageController}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(pageController: this.pageController);
}

class _HomePageState extends State<HomePage> {

  final PageController pageController;
  final ScrollController _scrollController = new ScrollController();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  _HomePageState({Key key, this.pageController});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          actions: <Widget>[
            Row(
              children: <Widget>[
                Icon(Icons.search),
                Container(
                  height: 30.0,
                  width: 1.0,
                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                  color: Colors.grey[300],
                ),
                 Tooltip(
                    message: "Carrinho",
                    child: Stack(
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                          },
                          child:Padding(padding: EdgeInsets.all(10), child:  Icon(Icons.shopping_cart,
                              color:  Colors.white,)
                          ),
                        ),
                        Positioned(
                          right: 5.0,
                          child: CircleAvatar(
                            backgroundColor:  Colors.black ,
                            radius: 10.0,
                            child: Text("100",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 10.0,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              ],
            )
          ],
        ),
        drawer: DrawerWidget(pageController),
      ),
      onWillPop: () => UtilServices.onBackPressed(context)
    );
  }
}
