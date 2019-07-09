import 'package:flutter/material.dart';
import 'package:loja_virtual/widgets/backgroud_widget.dart';

//@Author Ismael Alves
class AtendimentoTelefonePage extends StatefulWidget {

  @override
  _AtendimentoTelefonePageState createState() => _AtendimentoTelefonePageState();
}

class _AtendimentoTelefonePageState extends State<AtendimentoTelefonePage> {

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
                          Text("Atendimento Pelo Telefone",
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
            ],
          ),
        ],
      )
    );
  }
}
