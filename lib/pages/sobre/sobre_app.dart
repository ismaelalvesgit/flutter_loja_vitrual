import 'package:flutter/material.dart';
import 'package:loja_virtual/widgets/backgroud_widget.dart';

//@Author Ismael Alves
class SobreAppPage extends StatefulWidget {

  @override
  _SobreAppPageState createState() => _SobreAppPageState();
}

class _SobreAppPageState extends State<SobreAppPage> {

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
                snap: true,
                floating: true,
                backgroundColor: Colors.transparent,
                expandedHeight: 200.0,
                leading: IconButton(
                  onPressed: ()=> Navigator.pop(context),
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
                              image: DecorationImage(image: AssetImage("images/user.png"),
                              ),
                            ),
                          ),
                          Text("Sobre o App",
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
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Criador: ISMAEL ALVES XIMENES BEZERRA",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700]
                                ),
                              ),
                              Text("CNPJ: XXX.XXX.XX/XXXX-XX",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 15.0,
                                    color: Colors.grey[700]
                                ),
                              ),
                              Text("Inscrição Estadual: xxx.xxx.xxx.xx",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 15.0,
                                    color: Colors.grey[700]
                                ),
                              ),
                              Text("Endereço: Rua padre galvão, nº41",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 15.0,
                                    color: Colors.grey[700]
                                ),
                              ),
                              AboutListTile(
                                icon: Icon(Icons.shop),
                                child: Text("Versão",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 15.0,
                                      color: Colors.grey[700]
                                  ),
                                ),
                                applicationVersion: "0.0.1",
                                applicationName: "big incommecer",
                                applicationLegalese: "primeiro build usando flutter",
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
          ),
        ],
      )
    );
  }
}
