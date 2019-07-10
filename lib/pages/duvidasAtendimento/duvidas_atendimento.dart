import 'package:flutter/material.dart';
import 'package:loja_virtual/widgets/backgroud_widget.dart';

//@Author Ismael Alves
class DuvidasAtendimentoPage extends StatefulWidget {

  @override
  _DuvidasAtendimentoPageState createState() => _DuvidasAtendimentoPageState();
}

class _DuvidasAtendimentoPageState extends State<DuvidasAtendimentoPage> {

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
                              image: DecorationImage(image: AssetImage("images/conversation.png"),
                              ),
                            ),
                          ),
                          Text("Dúvidas de Atendimento",
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
              SliverAppBar(
                title: Text("Dúvidas de Atendimento",
                  style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 20.0,
                      color: Colors.white
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
                            children: <Widget>[
                              Text("What is Lorem Ipsum?Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                                "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a "
                                "galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also"
                                " the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the "
                                "release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like "
                                "Aldus PageMaker including versions of Lorem Ipsum. Why do we use it? It is a long established fact that a reader will "
                                "be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it "
                                "has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like"
                                " readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text,"
                                " and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over ""the "
                                "years, sometimes by accident, sometimes on purpose (injected humour and the like). Where does it come from?Contrary to"
                                "popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, "
                                "making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one "
                                "of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical "
                                "literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of  (The Extremes of Good "
                                "and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. "
                                "The first line of Lorem Ipsum, , comes from a line in section 1.10.32.",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 15.0,
                                    color: Colors.grey[700]
                                ),
                              ),
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
