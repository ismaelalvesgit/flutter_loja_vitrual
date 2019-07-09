import 'package:flutter/material.dart';
import 'package:loja_virtual/widgets/title_widget.dart';

//@Author Ismael Alves
class MeusValesPage extends StatefulWidget {
  final PageController pageController;

  const MeusValesPage({Key key, this.pageController}) : super(key: key);
  @override
  _MeusValesPageState createState() => _MeusValesPageState(pageController: this.pageController);
}

class _MeusValesPageState extends State<MeusValesPage> {
  final PageController pageController;
  final ScrollController _scrollController = new ScrollController();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  _MeusValesPageState({Key key, this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: CustomScrollView(
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
                        Text("Meus Vales",
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
            SliverToBoxAdapter(child: TitleWidget(text: "Meus Vales", fontSize: 20.0, marginLeft: 10.0, marginRight: 10.0, marginTop: 10.0,)),
            SliverList(
              delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                return Container(
                  height: 140.0,
                  margin: EdgeInsets.all(10.0),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 120.0,
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("Cód:",
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          color: Colors.grey[700],
                                          fontSize: 20.0
                                      ),
                                    ),
                                    Text("#YMZ3715",
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          color: Colors.red,
                                          fontSize: 20.0
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Center(
                                  child: Text("R\$: 159,99",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Roboto",
                                        color: Colors.green,
                                        fontSize: 20.0
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ),
                      ),
                      Positioned(
                          bottom: 0.0,
                          right: 15.0,
                          child: RaisedButton(
                            onPressed: (){},
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Text("USAR",
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
                );
              }),
            )
          ],
        )
    );
  }
}
