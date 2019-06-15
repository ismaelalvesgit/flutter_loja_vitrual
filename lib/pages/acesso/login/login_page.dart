import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loja_virtual/pages/acesso/input_masked_format.dart';
import 'package:loja_virtual/pages/index_page.dart';
import 'package:loja_virtual/util_service/util_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//@Author Ismael Alves
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _keyScaffold = GlobalKey<ScaffoldState>();
  final _keyForm = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          key: _keyScaffold,
          body: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/fundo-acesso.jpg"),
                    fit: BoxFit.cover
                  )
                ),
              ),
              ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 100.0,
                            width: 100.0,
                            margin: EdgeInsets.only(top: 50.0, bottom: 20.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/online-shop.png")
                              )
                            ),
                          ),
                          Form(
                            key: _keyForm,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: _emailController,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey.withOpacity(0.8),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25.7),
                                      borderSide: BorderSide(color: Colors.grey.withOpacity(0.8),)
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    hintText: "Email",
                                    hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Roboto"
                                    ),
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.text,
                                  obscureText: true,
                                  controller: _passwordController,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.grey.withOpacity(0.8),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(25.7),
                                        borderSide: BorderSide(color: Colors.grey.withOpacity(0.8),)
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      hintText: "Senha",
                                      hintStyle: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Roboto"),
                                      prefixIcon: Icon(
                                        Icons.lock_open,
                                        color: Colors.red,
                                      ),
                                      suffixIcon: Icon(
                                        Icons.visibility_off,
                                        color: Colors.red,
                                      )
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                Container(
                                  height: 40.0,
                                  width: double.maxFinite,
                                  child: RaisedButton(
                                    onPressed: () {},
                                    color: Colors.red,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0)
                                    ),
                                    child: Text(
                                      "LOGIN",
                                      style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 15.0,
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                Container(
                                  height: 20.0,
                                  width: double.maxFinite,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Text(
                                      "Reste da Senha",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: "Roboto",
                                        fontSize: 18.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30.0),
                                Container(
                                  height: 20.0,
                                  width: double.maxFinite,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Row(
                                      crossAxisAlignment:CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Text("Voce não tem conta? Clique Aqui",
                                          style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 13.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(width: 10.0,),
                                        Text("Crie agora !",
                                          style: TextStyle(
                                            fontFamily: "Roboto",
                                            fontSize: 15.0,
                                            color: Colors.pink,
                                          ),
                                        ),
                                      ],
                                    )
                                  ),
                                ),
                                SizedBox(height: 30.0),
                              ],
                            )
                          )
                        ],
                      ),
                    )
                  ),
                  Container(
                    height: 1,
                    width: double.maxFinite,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Outras opções de login",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 15.0,
                            color: Colors.white
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          height: 40.0,
                          width: double.maxFinite,
                          child: RaisedButton(
                            onPressed: (){},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            color: Colors.red,
                            child: Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.google, color: Colors.white,),
                                SizedBox(width: 10.0,),
                                Text("Google",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Roboto",
                                  color: Colors.white,
                                  fontSize: 15.0
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 40.0,
                          margin: EdgeInsets.only(top: 10.0),
                          width: double.maxFinite,
                          child: RaisedButton(
                            onPressed: (){},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            color: Colors.blue[900],
                            child: Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.facebookF, color: Colors.white,),
                                SizedBox(width: 10.0,),
                                Text("FACEBOOK",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: Colors.white,
                                      fontSize: 15.0
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 40.0,
                          width: double.maxFinite,
                          margin: EdgeInsets.only(top: 10.0),
                          child: RaisedButton(
                            onPressed: (){},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)
                            ),
                            color: Colors.blue,
                            child: Row(
                              children: <Widget>[
                                Icon(FontAwesomeIcons.twitter, color: Colors.white,),
                                SizedBox(width: 10.0,),
                                Text("TWITTER",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      color: Colors.white,
                                      fontSize: 15.0
                                  ),
                                )
                              ],
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
        ),
        onWillPop: () => UtilServices.onBackPressed(context));
  }
}
