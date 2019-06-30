import 'package:flutter/material.dart';
import 'package:loja_virtual/pages/configuracao/configuracao_page.dart';
import 'package:loja_virtual/pages/home/home_page.dart';
import 'package:loja_virtual/pages/departamentos/departamentos_page.dart';
import 'package:loja_virtual/pages/favoritos/favoritos_page.dart';
import 'package:loja_virtual/pages/meusPedidos/meus_pedidos_page.dart';
import 'package:loja_virtual/pages/produtos/produtos_page.dart';

//@Author Ismael Alves
class IndexPage extends StatefulWidget {
  final bool produtos;

  const IndexPage({Key key, this.produtos}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState(produtos: this.produtos);
}

class _IndexPageState extends State<IndexPage> {
  final bool produtos;
  PageController _pageController;
  _IndexPageState({Key key, this.produtos});

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
          produtos ? ProdutosPage(pageController: _pageController,): HomePage(pageController: _pageController,),

          //Departamentoa Page
          DepartamentosPage(pageController: _pageController,),

          //Favoritos Page
          FavoritosPage(pageController: _pageController,),

          //Meus Pedidos Page
          MeusPedidosPage(pageController: _pageController,),

          //Configuracao Page
          ConfiguracaoPage(pageController: _pageController,),
        ],
      ),
    );
  }
}
