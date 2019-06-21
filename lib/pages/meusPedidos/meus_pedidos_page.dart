import 'package:flutter/material.dart';
import 'package:loja_virtual/widgets/title_widget.dart';

//@Author Ismael Alves
class MeusPedidosPage extends StatefulWidget {
  final PageController pageController;

  const MeusPedidosPage({Key key, this.pageController}) : super(key: key);
  @override
  _MeusPedidosPageState createState() => _MeusPedidosPageState(pageController: this.pageController);
}

class _MeusPedidosPageState extends State<MeusPedidosPage> {
  final PageController pageController;
  final ScrollController _scrollController = new ScrollController();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  _MeusPedidosPageState({Key key, this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
      return <Widget>[
        SliverAppBar(
          backgroundColor: Colors.transparent,
          expandedHeight: 200.0,
          leading: IconButton(
            onPressed: ()=> pageController.jumpToPage(0),
            icon: Icon(Icons.arrow_back_ios),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("images/backgroun-menu.jpg"),
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      margin: EdgeInsets.only(bottom: 10.0),
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/box.png"),
                        ),
                      ),
                    ),
                    Text("Meus Pedidos",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 20.0,
                        color: Colors.white
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ];
    },
    body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            TitleWidget(text: "Pedidos Abertos", fontSize: 25.0, marginBottom: 10.0,),
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index){
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  margin: EdgeInsets.only(top: 10.0 , bottom: 10.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Icon(Icons.timelapse, color: Colors.greenAccent,),
                                Text("Preparando",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 15.0,
                                      color: Colors.greenAccent
                                  ),
                                )
                              ],
                            ),
                            Divider(height: 2.0,color: Colors.red,),
                            Column(
                              children: <Widget>[
                                Icon(Icons.timelapse, color: Colors.greenAccent,),
                                Text("Preparando",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 15.0,
                                      color: Colors.greenAccent
                                  ),
                                )
                              ],
                            ),
                            Divider(),
                            Column(
                              children: <Widget>[
                                Icon(Icons.timelapse, color: Colors.greenAccent,),
                                Text("Preparando",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 15.0,
                                      color: Colors.greenAccent
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Pedido:",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 20.0,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text("#YMZ1596",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 20.0,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                );
              },
            )
          ],
        ),
      ))
    );
  }
}
