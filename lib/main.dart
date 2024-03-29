import 'package:flutter/material.dart';
import 'package:loja_virtual/pages/acesso/login/login_page.dart';
import 'package:loja_virtual/pages/index_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:loja_virtual/bloc/user_bloc.dart';

//@Author Ismael Alves
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => UserBloc()),
      ],
      child: MaterialApp(
          title: 'Loja Virtual',
          debugShowCheckedModeBanner: false,
          supportedLocales: [
            const Locale.fromSubtags(languageCode: 'en'),
            const Locale.fromSubtags(languageCode: 'pt'),
          ],
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: Locale.fromSubtags(languageCode: "pt", scriptCode: "pt", countryCode: "pt_BR"),
          theme: ThemeData(
            primaryColor: Colors.red,
            primarySwatch: Colors.grey,
          ),
          home: LoginPage()
      ),
    );
  }
}