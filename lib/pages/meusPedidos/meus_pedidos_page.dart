import 'package:flutter/material.dart';
import 'package:loja_virtual/pages/meusPedidos/meus_pedidos_detalhe_page.dart';
import 'package:loja_virtual/widgets/backgroud_widget.dart';
import 'package:loja_virtual/widgets/divider_widget.dart';
import 'package:loja_virtual/widgets/title_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    return WillPopScope(
      child: Scaffold(
        key: _scaffoldKey,
        body:Stack(
          children: <Widget>[
            BackgroundWidget(),
            CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
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
                SliverToBoxAdapter(
                  child:  TitleWidget(text: "Pedidos Abertos", fontSize: 25.0, marginLeft: 10.0, marginTop: 10.0,),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index){
                        return  _widgetCardOrder(context, index);
                      },
                      childCount: 2
                  ),
                ),
                SliverToBoxAdapter(
                  child:  TitleWidget(text: "Pedidos Finalizados", fontSize: 25.0, marginBottom: 10.0, marginLeft: 10.0, marginTop: 20.0,),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index){
                        return  _widgetCardOrder(context, index);
                      },
                      childCount: 2
                  ),
                )
              ],
            )
          ],
        )
      ),
      onWillPop: ()=> pageController.previousPage(duration: Duration(milliseconds: 100), curve: Curves.bounceOut));
  }

  Widget _widgetCardOrder(BuildContext context, int index){
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> MeusPedidosDetalhePage()));
      },
      borderRadius: BorderRadius.circular(1.0),
      splashColor: Colors.red,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        margin: EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.timelapse, color: Colors.greenAccent,),
                      Text("Preparando",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 12.0,
                            color: Colors.greenAccent
                        ),
                      )
                    ],
                  ),
                  Expanded(child: DividerWidget(bottom: 10.0,)),
                  Column(
                    children: <Widget>[
                      Icon(FontAwesomeIcons.truck, color: Colors.grey[700],),
                      Text("Em Tranporte",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 12.0,
                            color: Colors.grey[700]
                        ),
                      )
                    ],
                  ),
                  Expanded(child: DividerWidget(bottom: 10.0,)),
                  Column(
                    children: <Widget>[
                      Icon(Icons.location_on, color: Colors.grey[700],),
                      Text("Entrege",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 12.0,
                            color: Colors.grey[700]
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.0,),
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
      ),
    );
  }
}
