import 'package:flutter/material.dart';
import 'package:loja_virtual/util_service/util_service.dart';
import 'package:loja_virtual/widgets/drawer_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  final PageController pageController;

  const HomePage({Key key, this.pageController}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(pageController: this.pageController);
}

class _HomePageState extends State<HomePage> {

  final PageController pageController;
  final ScrollController _scrollController = new ScrollController();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  _HomePageState({Key key, this.pageController});

  Future<String> _refresList() async {
    return "";
  }

  Widget _widgetMenuSide(BuildContext context, String photo){
    return InkWell(
      onTap: (){},
      borderRadius: BorderRadius.circular(25.0),
      splashColor: Colors.red,
      child: Container(
        height: 70.0,
        width: 70.0,
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Image.asset(photo),
      ),
    );
  }

  Widget _widgetCardProduct(BuildContext context, String photo){
    return InkWell(
      onTap: (){},
      borderRadius: BorderRadius.circular(1.0),
      splashColor: Colors.red,
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Container(
                height: 100.0,
                width: 100.0,
                margin: EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(photo),
                        fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(50.0)
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Tenis Nike",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18.0,
                          color: Colors.grey[700]
                      ),
                    ),
                    Text("R\$ 150,00",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18.0,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 50.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(Icons.star, color: Colors.red,),
                            Icon(Icons.star, color: Colors.red,),
                            Icon(Icons.star, color: Colors.red,),
                            Icon(Icons.star_border, color: Colors.grey[700],),
                            Icon(Icons.star_border, color: Colors.grey[700],),
                          ],
                        ),
                      ),
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerWidget(pageController),
        body: RefreshIndicator(
          color: Colors.white,
          backgroundColor: Colors.red,
          child: Stack(
            children: <Widget>[
              Container(
                height: 250.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/home.jpeg"),
                        fit: BoxFit.cover
                    )
                ),
              ),
              CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    floating: true,
                    snap: true,
                    backgroundColor: Colors.red.withOpacity(0.9),
                    actions: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.search),
                          Container(
                            height: 30.0,
                            width: 1.0,
                            margin: EdgeInsets.only(left: 10.0, right: 10.0),
                            color: Colors.grey[300],
                          ),
                          Tooltip(
                            message: "Carrinho",
                            child: Stack(
                              children: <Widget>[
                                InkWell(
                                  onTap: (){
                                  },
                                  child:Padding(padding: EdgeInsets.all(10), child:  Icon(Icons.shopping_cart,
                                    color:  Colors.white,)
                                  ),
                                ),
                                Positioned(
                                  right: 5.0,
                                  child: CircleAvatar(
                                    backgroundColor:  Colors.black ,
                                    radius: 10.0,
                                    child: Text("100",
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 10.0,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate([
                        Container(
                          height: 170.0,
                        )
                      ])
                  ),
                  SliverStaggeredGrid.countBuilder(
                    crossAxisCount: 2,
                    itemCount: 3,
                    itemBuilder: (BuildContext content, int index) {
                      return Container(
                        child: CarouselSlider(
                          viewportFraction: 1.0,
                          aspectRatio: MediaQuery.of(content).size.aspectRatio,
                          autoPlay: true,
                          reverse: index == 2 ? false : true,
                          scrollDirection: index.isEven ? Axis.horizontal : Axis.vertical,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          pauseAutoPlayOnTouch: Duration(seconds: 10),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          items: [
                            "images/produtos/2/1.jpg",
                            "images/produtos/2/2.jpg",
                            "images/produtos/2/3.jpg",
                            "images/produtos/2/4.jpg",
                            "images/produtos/2/5.jpg",
                            "images/produtos/2/6.jpg",
                            "images/produtos/2/7.jpg"
                          ].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(i),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      );
                    },
                    staggeredTileBuilder: (int index) => new StaggeredTile.count(1, index.isEven ? 1 : 2),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 90.0,
                      margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                      decoration: BoxDecoration(),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _widgetMenuSide(context, "images/menu/fashion.png"),
                          _widgetMenuSide(context, "images/menu/jeans.png"),
                          _widgetMenuSide(context, "images/menu/shoe.png"),
                          _widgetMenuSide(context, "images/menu/console.png"),
                          _widgetMenuSide(context, "images/menu/laptop.png"),
                          _widgetMenuSide(context, "images/menu/smartphone.png"),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10.0),
                            child: Text("|",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700]
                              ),
                            ),
                          ),
                          Text("Novidades",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 20.0,
                              color: Colors.grey
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 130.0,
                        margin: EdgeInsets.all(10.0),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          itemBuilder: (BuildContext context, int index){
                            return _widgetCardProduct(context, "images/produtos/2/${index+1}.jpg");
                          },
                        ),
                      )
                    ])
                  )
                ],
              )
            ],
          ),
        onRefresh: _refresList),
      ),
      onWillPop: () => UtilServices.onBackPressed(context)
    );
  }
}
