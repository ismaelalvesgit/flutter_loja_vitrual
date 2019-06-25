import 'package:flutter/material.dart';
import 'package:loja_virtual/widgets/title_widget.dart';

//@Author Ismael Alves
class ConfiguracaoPage extends StatefulWidget {
  final PageController pageController;

  const ConfiguracaoPage({Key key, this.pageController}) : super(key: key);
  @override
  _ConfiguracaoPageState createState() => _ConfiguracaoPageState(pageController: this.pageController);
}

class _ConfiguracaoPageState extends State<ConfiguracaoPage> {
  final PageController pageController;
  final ScrollController _scrollController = new ScrollController();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  _ConfiguracaoPageState({Key key, this.pageController});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
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
                          Text("Ismael alves",
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
          body: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      TitleWidget(text: "Identificação", fontSize: 20.0,),
                      Container(
                        height: 170.0,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: 150.0,
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  child: Container(
                                    width: double.maxFinite,
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("ismael alves",
                                          style: TextStyle(
                                              fontFamily: "Roboto",
                                              color: Colors.grey[700],
                                              fontSize: 15.0
                                          ),
                                        ),
                                        Divider(),
                                        Text("cearaismael1997@gmail.com",
                                          style: TextStyle(
                                              fontFamily: "Roboto",
                                              color: Colors.grey[700],
                                              fontSize: 15.0
                                          ),
                                        ),
                                        Text("057.###.###-##",
                                          style: TextStyle(
                                              fontFamily: "Roboto",
                                              color: Colors.grey[700],
                                              fontSize: 15.0
                                          ),
                                        ),
                                        Text("22/06/1997",
                                          style: TextStyle(
                                              fontFamily: "Roboto",
                                              color: Colors.grey[700],
                                              fontSize: 15.0
                                          ),
                                        ),
                                        Text("(085)98852-3391",
                                          style: TextStyle(
                                              fontFamily: "Roboto",
                                              color: Colors.grey[700],
                                              fontSize: 15.0
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                              ),
                            ),
                            Positioned(
                              bottom: 0.0,
                              right: 10.0,
                              child: RaisedButton(
                                onPressed: (){},
                                color: Colors.red,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)
                                ),
                                child: Text("ALTERAR DADOS",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: Colors.white,
                                      fontSize: 15.0
                                  ),
                                ),
                              )
                            )
                          ],
                        ),
                      )
                    ],
                  )
                )
              ),
              SliverToBoxAdapter(
                  child: Container(
                      margin: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          TitleWidget(text: "Endereços", fontSize: 20.0,),
                          Container(
                            height: 170.0,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 150.0,
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0)
                                      ),
                                      child: Container(
                                        width: double.maxFinite,
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text("casa",
                                              style: TextStyle(
                                                  fontFamily: "Roboto",
                                                  color: Colors.grey[700],
                                                  fontSize: 15.0
                                              ),
                                            ),
                                            Divider(),
                                            Text("Rua Padre Galvão, 41",
                                              style: TextStyle(
                                                  fontFamily: "Roboto",
                                                  color: Colors.grey[700],
                                                  fontSize: 15.0
                                              ),
                                            ),
                                            Text("cor branca",
                                              style: TextStyle(
                                                  fontFamily: "Roboto",
                                                  color: Colors.grey[700],
                                                  fontSize: 15.0
                                              ),
                                            ),
                                            Text("Pici, Fortaleza",
                                              style: TextStyle(
                                                  fontFamily: "Roboto",
                                                  color: Colors.grey[700],
                                                  fontSize: 15.0
                                              ),
                                            ),
                                            Text("CEP 60511-270",
                                              style: TextStyle(
                                                  fontFamily: "Roboto",
                                                  color: Colors.grey[700],
                                                  fontSize: 15.0
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                  ),
                                ),
                                Positioned(
                                    bottom: 0.0,
                                    right: 10.0,
                                    child: RaisedButton(
                                      onPressed: (){},
                                      color: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5.0)
                                      ),
                                      child: Text("ALTERAR DADOS",
                                          style: TextStyle(
                                              fontFamily: "Roboto",
                                              color: Colors.white,
                                              fontSize: 15.0
                                          ),
                                      ),
                                    )
                                )
                              ],
                            ),
                          )
                        ],
                      )
                  )
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 40.0,
                  width: double.maxFinite,
                  margin: EdgeInsets.only(top: 60.0, bottom: 10.0, left: 10.0, right: 10.0),
                  child: RaisedButton(
                    onPressed: (){},
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)
                    ),
                    child: Text("SAIR DA MINHA CONTA",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          color: Colors.white,
                          fontSize: 15.0
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        )
    );
  }
}
