import 'package:flutter/material.dart';
import 'package:loja_virtual/widgets/title_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

//@Author Ismael Alves
class FavoritosPage extends StatefulWidget {
  final PageController pageController;
  const FavoritosPage({Key key, this.pageController}) : super(key: key);
  @override
  _FavoritosPageState createState() => _FavoritosPageState(pageController: this.pageController);
}

class _FavoritosPageState extends State<FavoritosPage> {
  final PageController pageController;
  final ScrollController _scrollController = new ScrollController();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  _FavoritosPageState({Key key, this.pageController});

  final List<String> imgList = [
    "images/produtos/2/1.jpg",
    "images/produtos/2/2.jpg",
    "images/produtos/2/3.jpg",
    "images/produtos/2/4.jpg",
    "images/produtos/2/5.jpg",
    "images/produtos/2/6.jpg",
    "images/produtos/2/7.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text("Favoritos"),
            centerTitle: true,
            leading: IconButton(
              onPressed: ()=> pageController.jumpToPage(0),
              icon: Icon(Icons.arrow_back_ios),
            ),
          ),
          body: ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index){
              if(index == 0){
                return TitleWidget(text: "Favoritos", fontSize: 20.0, marginTop: 10.0,);
              }else {
                return _widgetCardFavorite(context, index);
              }
            },
          )
      ),
      onWillPop: ()=> pageController.previousPage(duration: Duration(milliseconds: 100), curve: Curves.bounceInOut)
    );
  }

  Widget _widgetCardFavorite(BuildContext context ,int index) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
      ),
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              CarouselSlider(
                height: 300.0,
                viewportFraction: 0.8,
                enlargeCenterPage: true,
                aspectRatio: MediaQuery
                    .of(context)
                    .size
                    .aspectRatio,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                pauseAutoPlayOnTouch: Duration(seconds: 10),
                autoPlayCurve: Curves.easeInCubic,
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
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0)
                            )
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Positioned(
                  right: 5.0,
                  top: 5.0,
                  child: IconButton(onPressed: () {},
                    icon: Icon(Icons.favorite, color: Colors.pink,),
                    splashColor: Colors.red,
                  )
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.star, color: Colors.pink,),
                        Icon(Icons.star, color: Colors.pink,),
                        Icon(Icons.star, color: Colors.pink,),
                        Icon(Icons.star_border, color: Colors.pink,),
                        Icon(Icons.star_border, color: Colors.pink,),
                      ],
                    ),
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
                SizedBox(height: 10.0,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text("ROUPA XYZ $index",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing "
                            "and typesetting industry. Lorem Ipsum has been the industry's standard "
                            "dummy text ever since the 1500s, when an unknown printer took a "
                            "galley of type and scrambled it to make a type specimen book. It "
                            "has survived not only five centuries, but also the leap into electronic "
                            "typesetting, remaining essentially unchanged. It was popularised in the "
                            "1960s with the release of Letraset sheets containing Lorem Ipsum passages, "
                            "and more recently with desktop publishing software like Aldus PageMaker "
                            "including versions of Lorem Ipsum.",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 18.0,
                            color: Colors.grey[700]
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    IconButton(
                      onPressed: (){},
                      icon: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.red,
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


