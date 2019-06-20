import 'package:flutter/material.dart';
import 'package:loja_virtual/pages/home/home_page.dart';
import 'package:loja_virtual/pages/departamentos/departamentos_page.dart';
import 'package:loja_virtual/pages/favoritos/favoritos_page.dart';

//@Author Ismael Alves
class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          //Home Page
          HomePage(pageController: _pageController,),

          //Departamentoa Page
          DepartamentosPage(pageController: _pageController,),

          //Favoritos Page
          FavoritosPage(pageController: _pageController,),
        ],
      ),
    );
  }
}
