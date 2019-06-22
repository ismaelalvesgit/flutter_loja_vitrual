import 'package:flutter/material.dart';
import 'package:loja_virtual/widgets/divider_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//@Author Ismael Alves
class MeusPedidosDetalhePage extends StatefulWidget {


  @override
  _MeusPedidosDetalhePageState createState() => _MeusPedidosDetalhePageState();
}

class _MeusPedidosDetalhePageState extends State<MeusPedidosDetalhePage> {

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
              title: Row(
                children: <Widget>[
                  Text("Pedido ",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 18.0,
                        color: Colors.white
                    ),
                  ),
                  Text("#YMZ1596",
                    style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 20.0,
                        color: Colors.white
                    ),
                  )
                ],
              ),
              centerTitle: true,
              leading: IconButton(
                onPressed: ()=> Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
            SliverToBoxAdapter(
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Resumo Pedido:",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 15.0,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text("#YMZ1596",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 15.0,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.0,),
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
                        children: <Widget>[
                          Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/produtos/2/1.jpg")
                                )
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Blusa Básica",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 15.0,
                                      color: Colors.grey[700]
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Quant:",
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 15.0,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text("x1",
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 15.0,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Valor:",
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 15.0,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Text("R\$ 150,99",
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 15.0,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Endereço de entrega:",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 15.0,
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(height: 10.0,),
                                Text("Rua Padre Galvão, 41",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 15.0,
                                      color: Colors.grey[700]
                                  ),
                                ),
                                Text("cor branca",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 15.0,
                                      color: Colors.grey[700]
                                  ),
                                ),
                                Text("Pici, Fortaleza - ce",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 15.0,
                                      color: Colors.grey[700]
                                  ),
                                ),
                                Text("CEP 60511-270",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 15.0,
                                      color: Colors.grey[700]
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox( height: 10.0,),
                      ExpansionTile(
                        title: Text("Rastrear Pedido",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 15.0,
                              color: Colors.grey[700]
                          ),
                        ),
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text("Seu pedido esta virando a esquina agora !! :)",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.grey[700]
                              ),
                            ),
                          )
                        ],
                      ),
                      ExpansionTile(
                        title: Text("Falar Sobre esta entrega",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 15.0,
                              color: Colors.grey[700]
                          ),
                        ),
                        children: <Widget>[
                          Form(
                            child: Container(
                              margin: EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    maxLines: 3,
                                    cursorColor: Colors.red,
                                    decoration: InputDecoration(
                                      hintText: "Digite sua mensagem"
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Container(
                                    height: 40.0,
                                    width: double.maxFinite,
                                    child: RaisedButton.icon(
                                      onPressed: (){},
                                      label: Text("Enviar",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 15.0,
                                            color: Colors.white
                                        ),
                                      ),
                                      icon: Icon(Icons.send, color: Colors.white,),
                                      color: Colors.red,
                                    )
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      ExpansionTile(
                        title: Text("compra de novo",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 15.0,
                              color: Colors.grey[700]
                          ),
                        ),
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text("Seu pedido esta virando a esquina agora !! :)",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.grey[700]
                              ),
                            ),
                          )
                        ],
                      ),
                      ExpansionTile(
                        title: Text("cancelar entrega",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 15.0,
                              color: Colors.grey[700]
                          ),
                        ),
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text("Seu pedido esta virando a esquina agora !! :)",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.grey[700]
                              ),
                            ),
                          )
                        ],
                      ),
                      ExpansionTile(
                        title: Text("Gerar nota fical",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 15.0,
                              color: Colors.grey[700]
                          ),
                        ),
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text("Seu pedido esta virando a esquina agora !! :)",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.grey[700]
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}
