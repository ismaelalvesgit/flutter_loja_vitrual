import 'package:flutter/material.dart';
import 'package:loja_virtual/pages/index_page.dart';
import 'package:loja_virtual/widgets/drawer_widget.dart';

class ProdutosPage extends StatefulWidget {
  final PageController pageController;
  const ProdutosPage({Key key, this.pageController}) : super(key: key);
  @override
  _ProdutosPageState createState() => _ProdutosPageState(pageController: this.pageController);
}
enum OrderOption{ single, multiple }

class _ProdutosPageState extends State<ProdutosPage> {
  final ScrollController _scrollController = new ScrollController();
  final PageController pageController;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  _ProdutosPageState({Key key, this.pageController});

  void _orderList(OrderOption result){
    switch(result){
      case OrderOption.single:

        break;
      case OrderOption.multiple:

        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerWidget(pageController: pageController, produtos: true,),
      floatingActionButton: Container(
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(50.0)
        ),
        child:  IconButton(
          onPressed: (){},
          splashColor: Colors.grey,
          icon: Icon(Icons.shopping_cart, color: Colors.white,),
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            snap: true,
            actions: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> IndexPage(produtos: true,)));
                },
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Icon(Icons.search),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      Navigator.push(context, PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (BuildContext context, _, __){
                          return Material(
                            color: Colors.black38,
                            child: InkWell(
                              child: Column(
                                children: <Widget>[
                                  ExpansionTile(title: Text("texte"))
                                ],
                              ),
                              onTap: (){
                                Navigator.pop(context);
                              },
                            ),
                          );
                        }
                      ));
                    },
                    child: Row(
                      children: <Widget>[
                        Text("Filtros",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            color: Colors.grey[700],
                            fontSize: 15.0
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down , color: Colors.grey[700],)
                      ],
                    ),
                  ),
                  PopupMenuButton<OrderOption>(itemBuilder: (context)=> <PopupMenuEntry<OrderOption>>[
                    const PopupMenuItem <OrderOption>(
                      child: Icon(Icons.list),
                      value: OrderOption.single,
                    ),
                    const PopupMenuItem <OrderOption>(
                      child: Icon(Icons.dashboard),
                      value: OrderOption.multiple,
                    ),
                  ],
                    child: Row(
                      children: <Widget>[
                        Text("Visual",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            color: Colors.grey[700],
                            fontSize: 15.0
                          ),
                        ),
                        Icon(Icons.tune , color: Colors.grey[700],)
                      ],
                    ),
                    onSelected: _orderList,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
