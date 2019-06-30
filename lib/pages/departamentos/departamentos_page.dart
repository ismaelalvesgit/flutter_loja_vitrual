import 'package:flutter/material.dart';
import 'package:loja_virtual/widgets/backgroud_widget.dart';
import 'package:loja_virtual/widgets/title_widget.dart';

//@Author Ismael Alves
class DepartamentosPage extends StatefulWidget {
  final PageController pageController;

  const DepartamentosPage({Key key, this.pageController}) : super(key: key);
  @override
  _DepartamentosPageState createState() => _DepartamentosPageState(pageController: this.pageController);
}

class _DepartamentosPageState extends State<DepartamentosPage> {
  final PageController pageController;
  final ScrollController _scrollController = new ScrollController();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  _DepartamentosPageState({Key key, this.pageController});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Departamentos"),
          leading: IconButton(
            onPressed: ()=> pageController.jumpToPage(0),
            icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            BackgroundWidget(),
            ListView(
              controller: _scrollController,
              children: <Widget>[
                TitleWidget(text: "Destaques", fontSize: 20.0, marginTop: 10.0, marginLeft: 10.0,),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  margin: EdgeInsets.all(10.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index){
                      return _widgetTile("Departamento$index", Colors.red, "images/menu/fashion.png");
                    },
                  ),
                ),

                TitleWidget(text: "Departamentos", fontSize: 20.0, marginTop: 10.0, marginLeft: 10.0,),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  margin: EdgeInsets.all(10.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index){
                      return _widgetTile("Departamento$index", Colors.grey[700], "images/menu/fashion.png");
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
      onWillPop: (){
        pageController.jumpToPage(0);
      }
    );
  }
}

Widget _widgetTile(String text, Color color, String icon){
  return Container(
    child: ListTile(
      contentPadding: EdgeInsets.all(10.0),
      leading: Container(
        height: 50.0,
        width: 40.0,
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Image.asset(icon),
      ),
      title: Text(text,
        style: TextStyle(
            fontFamily: "Roboto",
            fontSize: 15.0,
            color: color
        ),
      ),
      enabled: true,
      onTap: (){},
      trailing: Icon(Icons.arrow_drop_down_circle, color: color,),
    ),
  );
}
