import 'package:flutter/material.dart';
import 'package:loja_virtual/widgets/backgroud_widget.dart';

//@Author Ismael Alves
class AtendimentoTelefonePage extends StatefulWidget {

  @override
  _AtendimentoTelefonePageState createState() => _AtendimentoTelefonePageState();
}

class _AtendimentoTelefonePageState extends State<AtendimentoTelefonePage> {

  final ScrollController _scrollController = new ScrollController();
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
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
                              image: DecorationImage(image: AssetImage("images/atendimento_telefone.jpg"),
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
                                  image: DecorationImage(image: AssetImage("images/asking.png"),
                                  ),
                                ),
                              ),
                              Text("Atendimento Pelo Telefone",
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
                    elevation: 0.0,
                    floating: false,
                    pinned: true,
                    centerTitle: true,
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
                                    ListTile(
                                      onTap: (){},
                                      title: Text("Capitais e regiões metropolitanas",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 15.0,
                                            color: Colors.red
                                        ),
                                      ),
                                      subtitle: Text("xxxx xxxx*",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 15.0,
                                            color: Colors.grey[700]
                                        ),
                                      ),
                                      trailing: Icon(Icons.call, color: Colors.red,),
                                    ),
                                    ListTile(
                                      onTap: (){},
                                      title: Text("Estados do ceará",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 15.0,
                                            color: Colors.red
                                        ),
                                      ),
                                      subtitle: Text("xxxx xxx xxxx**",
                                        style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 15.0,
                                            color: Colors.grey[700]
                                        ),
                                      ),
                                      trailing: Icon(Icons.call, color: Colors.red,),
                                    ),
                                    SizedBox(height: 30.0,),
                                    Text("Atendimento das 8 ás 20hs, de segunda á sábado (exceto feriados).",
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 15.0,
                                          color: Colors.grey[700]
                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Text("* Ligações para serviço xxxx feitas de telefone fixo"
                                        "têm custo de ligção local + imposto locais, conforme, o "
                                        "Estado de origem, chamada feitas de celulares têm"
                                        "custo de ligação + imosto para celulares, conforme aa operadora. "
                                        "Essas Tafiras, cobradas nas respectivas faturas, não são "
                                        "válidas para ligação com DDD.",
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 15.0,
                                          color: Colors.grey[700]
                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Text("Para veirifica se a cidade de onde você está falando"
                                        "permite ligação sem código de operadora, tente discar"
                                        "diretamente o número XXXX XXXX.",
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 15.0,
                                          color: Colors.grey[700]
                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Text("Qualquer dúvida sobre a disponibilidade do serviço XXX, "
                                        "entre em contato com a operadora, intelig.",
                                      style: TextStyle(
                                          fontFamily: "Roboto",
                                          fontSize: 15.0,
                                          color: Colors.grey[700]
                                      ),
                                    ),
                                    SizedBox(height: 10.0,),
                                    Text("** Não é possivel efetuar ligações para XXXX de seu celular, apenas"
                                        "de telefones fixos",
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
      ),
    );
  }
}
