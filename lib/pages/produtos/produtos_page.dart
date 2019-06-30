import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loja_virtual/pages/index_page.dart';
import 'package:loja_virtual/widgets/drawer_widget.dart';
import 'package:loja_virtual/widgets/title_widget.dart';

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
  int currentIndex = 0;
  _ProdutosPageState({Key key, this.pageController});

  final List<String> imgList = [
    "images/produtos/2/1.jpg",
    "images/produtos/2/2.jpg",
    "images/produtos/2/3.jpg",
    "images/produtos/2/4.jpg",
    "images/produtos/2/5.jpg",
    "images/produtos/2/6.jpg",
    "images/produtos/2/7.jpg"
  ];

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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i){
          setState(() {
            currentIndex = i;
          });
        },
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.list),
            title: new Text('Lista'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.dashboard),
            title: new Text('Grid'),
          ),
        ],
        backgroundColor: Colors.red,
        unselectedItemColor: Colors.white,
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Container(
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
          Positioned(
            top: 0.0,
            right: 0.0,
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

          ),
        ],
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: (){
                      Navigator.push(context, PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (BuildContext context, _, __){
                          return _widgetFilter(context);
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
                        Icon(Icons.tune , color: Colors.grey[700],)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          currentIndex == 0? SliverList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                return _widgetSingleCard(context, index);
            },
            childCount: 2
            ),
          ):
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
                  items: imgList.map((i) {
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
          )
        ],
      ),
    );
  }

  Widget _widgetSingleCard(BuildContext context, int index){
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
      ),
      margin: EdgeInsets.only(left: 10.0, right: 10.0, top: index == 0 ? 10.0 : 5.0, bottom: index == 19 ? 10.0 : 5.0,),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Text("Produto xyz $index",
              style: TextStyle(
                  fontFamily: "Roboto",
                  color: Colors.grey[700],
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Stack(
              children: <Widget>[
                Container(
                  child: Column(children: <Widget>[
                    CarouselSlider(
                      height: 200.0,
                      viewportFraction: 1.0,
                      aspectRatio: MediaQuery.of(context).size.aspectRatio,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      pauseAutoPlayOnTouch: Duration(seconds: 10),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      items: imgList.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              height: 200.0,
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
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          /*StreamBuilder(
                                              stream: bloc.outIndicators,
                                              builder: (BuildContext context, snapshot){
                                                print(snapshot.data);
                                                if(snapshot.hasData){
                                                  return Row(
                                                    children: map<Widget>(
                                                      imgList,
                                                          (i, url) {
                                                        return Container(
                                                          width: 8.0,
                                                          height: 8.0,
                                                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                                          decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                              color: bloc.indicators[index] == i
                                                                  ? Color.fromRGBO(0, 0, 0, 0.9)
                                                                  : Color.fromRGBO(0, 0, 0, 0.4)),
                                                        );
                                                      },
                                                    ),
                                                  );
                                                }else{
                                                  return CircularProgressIndicator();
                                                }
                                              },
                                            ),*/
                          Text("R\$ 150,90",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700]
                            ),
                          )
                        ],
                      ),
                    )
                  ],),
                ),
                Positioned(
                    right: 5.0,
                    top: 5.0,
                    child: IconButton(onPressed: (){},
                      icon: Icon(index.isEven ? Icons.favorite : Icons.favorite_border,color: Colors.pink,),
                    )
                )
              ],
            ),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.star, color: Colors.pink,),
                    Icon(Icons.star, color: Colors.pink,),
                    Icon(Icons.star, color: Colors.pink,),
                    Icon(Icons.star_border, color: Colors.pink,),
                    Icon(Icons.star_border, color: Colors.pink,),
                  ],
                ),
                Icon(Icons.add_shopping_cart, color: Colors.red,)
              ],
            )
          ],
        ),
      ),
    );
  }


  Widget _widgetFilter( BuildContext context){
    return Material(
        color: Colors.black26,
        child: Scaffold(
            backgroundColor: Colors.black26,
            body: Stack(
              children: <Widget>[
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(height: double.maxFinite, width: double.maxFinite,),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: double.maxFinite,
                  color: Colors.white,
                  padding: EdgeInsets.only(right: 10.0, left: 10.0, top: 30.0, bottom: 10.0),
                  child: ListView(
                    children: <Widget>[
                      TitleWidget(text: "Ordenar", marginTop: 10.0,),
                      Wrap(
                        spacing: 10.0,
                        runAlignment: WrapAlignment.spaceEvenly,
                        children: <Widget>[
                          OutlineButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            borderSide: BorderSide(color: Colors.red, width: 2.0,),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Text("Menores Preços",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.red
                              ),
                            ),
                          ),
                          OutlineButton(
                            onPressed: (){},
                            borderSide: BorderSide(color: Colors.red, width: 2.0,),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Text("Maiores Preços",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.grey[700]
                              ),
                            ),
                          ),
                          OutlineButton(
                            onPressed: (){},
                            borderSide: BorderSide(color: Colors.red, width: 2.0,),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Text("Mais Relevantes",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.grey[700]
                              ),
                            ),
                          ),
                          OutlineButton(
                            onPressed: (){},
                            borderSide: BorderSide(color: Colors.red, width: 2.0,),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Text("Mais Vendidos",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.grey[700]
                              ),
                            ),
                          ),
                          OutlineButton(
                            onPressed: (){},
                            borderSide: BorderSide(color: Colors.red, width: 2.0,),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Text("Melhor Avaliados",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.grey[700]
                              ),
                            ),
                          ),
                        ],
                      ),

                      TitleWidget(text: "Tamanhos", marginTop: 10.0,),
                      Wrap(
                        spacing: 10.0,
                        runAlignment: WrapAlignment.spaceEvenly,
                        children: <Widget>[
                          OutlineButton(
                            onPressed: (){},
                            borderSide: BorderSide(color: Colors.red, width: 2.0,),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Text("P",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.grey[700]
                              ),
                            ),
                          ),
                          OutlineButton(
                            onPressed: (){},
                            borderSide: BorderSide(color: Colors.red, width: 2.0,),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Text("PP",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.grey[700]
                              ),
                            ),
                          ),
                          OutlineButton(
                            onPressed: (){},
                            borderSide: BorderSide(color: Colors.red, width: 2.0,),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Text("M",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.grey[700]
                              ),
                            ),
                          ),
                          OutlineButton(
                            onPressed: (){},
                            borderSide: BorderSide(color: Colors.red, width: 2.0,),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Text("G",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.grey[700]
                              ),
                            ),
                          ),
                          OutlineButton(
                            onPressed: (){},
                            borderSide: BorderSide(color: Colors.red, width: 2.0,),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Text("GG",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.grey[700]
                              ),
                            ),
                          ),
                        ],
                      ),

                      TitleWidget(text: "Cores", marginTop: 10.0,),
                      Wrap(
                        spacing: 10.0,
                        runAlignment: WrapAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: (){},
                            color:  Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Text("Branco",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.black
                              ),
                            ),
                          ),
                          RaisedButton(
                            onPressed: (){},
                            color:  Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Text("Azul",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.white
                              ),
                            ),
                          ),
                          RaisedButton(
                            onPressed: (){},
                            color:  Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Text("Preto",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.white
                              ),
                            ),
                          ),
                          RaisedButton(
                            onPressed: (){},
                            color:  Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Text("Vermelha",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.white
                              ),
                            ),
                          ),
                          RaisedButton(
                            onPressed: (){},
                            color:  Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                            ),
                            child: Text("Verde",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
        )
    );
  }
}
