import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:loja_virtual/widgets/title_widget.dart';

class ProdutoPage extends StatefulWidget {
  @override
  _ProdutoPageState createState() => _ProdutoPageState();
}

class _ProdutoPageState extends State<ProdutoPage> {

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int _current = 0;

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
    return Scaffold(
        body:  NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                expandedHeight: 410.0,
                leading: IconButton(
                  onPressed: ()=> Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios, color: Colors.pink,),
                ),
                actions: <Widget>[
                  IconButton(onPressed: () {},
                    icon: Icon(Icons.favorite, color: Colors.pink,),
                    splashColor: Colors.red,
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: <Widget>[
                      CarouselSlider(
                        height: 450.0,
                        viewportFraction: 1.0,
                        enlargeCenterPage: true,
                        aspectRatio: MediaQuery.of(context).size.aspectRatio,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        pauseAutoPlayOnTouch: Duration(seconds: 10),
                        autoPlayCurve: Curves.easeInCubic,
                        onPageChanged: (index) {
                          setState(() {
                            _current = index;
                          });
                        },
                        items: imgList.map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                height: 450.0,
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
                      Positioned(
                        bottom: 20.0,
                        right: 10.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: map<Widget>(
                            imgList,
                                (index, url) {
                              return Container(
                                width: 8.0,
                                height: 8.0,
                                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _current == index
                                        ? Color.fromRGBO(0, 0, 0, 0.9)
                                        : Color.fromRGBO(0, 0, 0, 0.4)),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Wrap(
                  children: <Widget>[
                    Text("300 QST",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18.0,
                          color: Colors.grey[700]
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 1.0, color: Colors.pink)
                      ),
                      padding: EdgeInsets.all(5.0),
                      margin: EdgeInsets.only( left: 10.0, right: 10.0),
                      child: Text("BLUSA",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 12.0,
                            color: Colors.pink
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("BLUSA BÁSICA ZINZA",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700]
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Text("R\$ 150.99",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.pink
                          ),
                        ),
                        Text("40% off",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 15.0,
                              color: Colors.grey[700]
                          ),
                        ),
                      ],
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
                SizedBox(height: 10.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("(Cód. 3255235)",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 10.0,
                          color: Colors.grey[700]
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.star, color: Colors.pink,),
                        Icon(Icons.star, color: Colors.pink,),
                        Icon(Icons.star, color: Colors.pink,),
                        Icon(Icons.star_border, color: Colors.pink,),
                        Icon(Icons.star_border, color: Colors.pink,),
                        SizedBox(width: 10.0,),
                        Text("(11)",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 15.0,
                              color: Colors.grey[700]
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.0,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("COR (1 OPÇÃO)",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700]
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: (){},
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            margin: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/produtos/2/1.jpg"),
                                    fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("TAMANHO (5 OPÇÕES)",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700]
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        InkWell(
                          onTap: (){},
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            margin: EdgeInsets.only(top: 10.0, right: 5.0, left: 10.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(width: 1.0, color: Colors.black)
                            ),
                            child: Text("P",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.black
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){},
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            margin: EdgeInsets.only(top: 10.0, right: 10.0, left: 5.0),
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(width: 1.0, color: Colors.red)
                            ),
                            child: Text("P",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.red
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.remove_circle_outline, color: Colors.black, size: 40.0,),
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.all(0.0),
                          ),
                          Text("100",
                            style: TextStyle(
                                fontFamily: "Roboto",
                                fontSize: 30.0,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.add_circle_outline, color: Colors.red, size: 40.0,),
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.all(0.0),
                          ),
                        ],
                      ),
                      RaisedButton.icon(
                        onPressed: (){},
                        icon: Icon(Icons.shopping_basket, color: Colors.white,),
                        label: Text("COMPRA",
                          style: TextStyle(
                              fontFamily: "Roboto",
                              fontSize: 15.0,
                              color: Colors.white
                          ),
                        ),
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                      )
                    ],
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  margin: EdgeInsets.all(0.0),
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("13 avaliações",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey[700]
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.star, color: Colors.pink, size: 15.0,),
                                    Icon(Icons.star, color: Colors.pink, size: 15.0,),
                                    Icon(Icons.star, color: Colors.pink, size: 15.0,),
                                    Icon(Icons.star_border, color: Colors.pink, size: 15.0,),
                                    Icon(Icons.star_border, color: Colors.pink, size: 15.0,),
                                    SizedBox(width: 10.0,),
                                    Text("3.2 de estrelas",
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey[700]
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            RaisedButton.icon(
                              onPressed: (){},
                              icon: Icon(Icons.speaker_notes, color: Colors.white,),
                              label: Text("Avaliar",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 15.0,
                                    color: Colors.white
                                ),
                              ),
                              color: Colors.grey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10.0,),
                        Row(
                          children: <Widget>[
                            Container(
                              height: 40.0,
                              width: 40.0,
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(50.0)
                              ),
                              child: Text("46%",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 10.0,
                                    color: Colors.white
                                ),
                              ),
                            ),
                            SizedBox(width: 5.0,),
                            Text("dos clientes recomendam este produto",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 13.0,
                                  color: Colors.grey[700]
                              ),
                            )
                          ],
                        ),
                        Divider(),
                        _widgetComments("Excelente produto", '"Uniu preço e qualidade! Recomendo a compra pois vale muito a pena"'),
                        Divider(),
                        _widgetComments("Gostei muito do produto", '"Produto de excelente qualidade eu recomendo..."'),
                        Divider(),
                        _widgetComments("Linda", '"Amei Amei Amei... Lindo Lindo Lindo Lindo"'),
                        SizedBox(height: 20.0,),
                        Container(
                          height: 40.0,
                          width: double.maxFinite,
                          child: RaisedButton(
                            onPressed: (){},
                            color: Colors.grey,
                            child: Text("VER TODAS AS 13 AVALIAÇÕES",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15.0,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ),
                TitleWidget(text: "Aproveite e veja Também", fontSize: 20.0, marginTop: 20.0,),
                Container(
                  height: 135.0,
                  child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index){
                    return Card(
                      margin: EdgeInsets.only(bottom: 10.0, top: 10.0, right: 10.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 100.0,
                              width: 100.0,
                              margin: EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("images/produtos/2/1.jpg"),
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
                                  Expanded(child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: <Widget>[
                                      Icon(Icons.star, color: Colors.red,),
                                      Icon(Icons.star, color: Colors.red,),
                                      Icon(Icons.star, color: Colors.red,),
                                      Icon(Icons.star_border, color: Colors.grey[700],),
                                      Icon(Icons.star_border, color: Colors.grey[700],),
                                    ],
                                  ),)
                                ],
                              ),
                            ),
                          ],
                        )
                      ),
                    );
                  },
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  Widget _widgetComments(String titulo, String comentario){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(titulo,
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 15.0,
                  color: Colors.grey[700]
              ),
            ),
            Row(
              children: <Widget>[
                Icon(Icons.star, color: Colors.pink, size: 20.0,),
                Icon(Icons.star, color: Colors.pink, size: 20.0,),
                Icon(Icons.star, color: Colors.pink, size: 20.0,),
                Icon(Icons.star_border, color: Colors.pink, size: 20.0,),
                Icon(Icons.star_border, color: Colors.pink, size: 20.0,),
              ],
            )
          ],
        ),
        Text("$comentario",
          style: TextStyle(
              fontFamily: "Roboto",
              fontSize: 15.0,
              color: Colors.grey[700]
          ),
        )
      ],
    );
  }
}


