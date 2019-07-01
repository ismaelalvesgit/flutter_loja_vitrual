import 'package:flutter/material.dart';

class FinalizarPedidoPage extends StatefulWidget {
  @override
  _FinalizarPedidoPageState createState() => _FinalizarPedidoPageState();
}

class _FinalizarPedidoPageState extends State<FinalizarPedidoPage> {
  final ScrollController _scrollController = new ScrollController();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
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
              child: Text("Finalizar Pedido"),
            ),
            centerTitle: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index){
              return _widgetCardProduct(context, index);
            }, childCount: 10),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Divider(color: Colors.grey[700],),
                  SizedBox(height: 10.0,),
                  ExpansionTile(
                    title: Text("Cupom de desconto",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 15.0,
                          color: Colors.grey[700]
                      ),
                    ),
                    leading: Icon(Icons.tag_faces),
                    trailing: Icon(Icons.card_giftcard),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20.0, right: 10.0),
                        child: TextFormField(
                          cursorColor: Colors.red,
                          decoration: InputDecoration(
                              hintText: "Digite seu o Numero do cupom"
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  ExpansionTile(
                    title: Text("Endereço de entrega",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 15.0,
                          color: Colors.grey[700]
                      ),
                    ),
                    leading: Icon(Icons.location_on),
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 20.0, right: 10.0),
                        child: TextFormField(
                          cursorColor: Colors.red,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "Digite seu Cep"
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text("Resumo dp pedido:",
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 18.0,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Sub total:",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 15.0,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text("R\$ 500,99",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 15.0,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                          Divider(color: Colors.grey[700],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Desconto:",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 15.0,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text("R\$ 10,99",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 15.0,
                                    color: Colors.green,
                                ),
                              )
                            ],
                          ),
                          Divider(color: Colors.grey[700],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Frete:",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 15.0,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Text("Free",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 15.0,
                                    color: Colors.green,
                                ),
                              )
                            ],
                          ),
                          Divider(color: Colors.grey[700],),
                          SizedBox(height: 30.0,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text("TOTAL: R\$ 500,99",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 22.0,
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
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
