import 'package:flutter/material.dart';
import 'package:loja_virtual/widgets/backgroud_widget.dart';
class CarrinhoPage extends StatefulWidget {
  @override
  _CarrinhoPageState createState() => _CarrinhoPageState();
}

class _CarrinhoPageState extends State<CarrinhoPage> {

  final ScrollController _scrollController = new ScrollController();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          BackgroundWidget(),
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                floating: true,
                snap: true,
                leading: IconButton(
                  onPressed: ()=> Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                ),
                title: InkWell(
                  onTap: (){
                    _scrollController.animateTo(0.0, duration: Duration(milliseconds: 800), curve: Curves.decelerate);
                  },
                  borderRadius: BorderRadius.circular(10.0),
                  splashColor: Colors.white,
                  child: Text("Carrinho"),
                ),
                centerTitle: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                  return _widgetCardProduct(context, index);
                },
                childCount: 10),
              ),
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Divider( color: Colors.grey[700],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("SUB TOTAL: R\$ 500,99",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 18.0,
                                color: Colors.greenAccent
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Container(
                        width: double.maxFinite,
                        height: 40.0,
                        child: RaisedButton(
                          onPressed: (){},
                          color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("CONTINUAR",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.white
                                ),
                              ),
                              Icon(Icons.add_shopping_cart, color: Colors.white,)
                            ],
                          ),
                        )
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 40.0,
                        margin: EdgeInsets.only(top: 10.0),
                        child: RaisedButton(
                          onPressed: (){},
                          color: Colors.grey[700],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.add_shopping_cart, color: Colors.white,),
                              Text("FINALIZAR PEDIDO",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 15.0,
                                    color: Colors.white
                                ),
                              )
                            ],
                          ),
                        )
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _widgetNoData(){
    return SliverToBoxAdapter(
      child: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4.2, right: 10.0, left: 10.0),
        child: Column(
          children: <Widget>[
            Icon(Icons.remove_shopping_cart, color: Colors.grey[700], size: 200.0,),
            SizedBox(height: 10.0,),
            Text("Parece que seu carrinho está vazio :(",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 18.0,
                  color: Colors.grey[700]
              ),
            ),
            Container(
              height: 40.0,
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height / 5),
              width: double.maxFinite,
              child: RaisedButton(
                onPressed: (){},
                color: Colors.red,
                child: Text("COMPRE AGORA",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 15.0,
                      color: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _widgetCardProduct(BuildContext context, int index){
    return InkWell(
      onTap: (){

      },
      borderRadius: BorderRadius.circular(10.0),
      splashColor: Colors.red,
      child: Card(
        margin: EdgeInsets.only(left: 10.0, right: 10.0, top: index == 0 ? 10.0: 5.0, bottom:  index == 5 ? 10.0 : 5.0,),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 80.0,
                width: 80.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/produtos/2/1.jpg")
                    )
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Blusa Básica",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 18.0,
                              color: Colors.grey[700]
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          borderRadius: BorderRadius.circular(25.0),
                          splashColor: Colors.red,
                          child: Icon(Icons.close, color: Colors.grey[700]),
                        )
                      ],
                    ),
                    Text( "Lorem Ipsum is simply dummy text of the printing "
                        "and typesetting...",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 15.0,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("R\$ 150,99",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 15.0,
                              color: Colors.red,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: (){},
                              borderRadius: BorderRadius.circular(25.0),
                              splashColor: Colors.red,
                              child: Icon(Icons.remove, color: Colors.black, size: 30.0,),
                            ),
                            Text("1",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 18.0,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            InkWell(
                              onTap: (){},
                              borderRadius: BorderRadius.circular(25.0),
                              splashColor: Colors.red,
                              child: Icon(Icons.add, color: Colors.red, size: 30.0,),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
