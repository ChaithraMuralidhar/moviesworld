import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutterkit/app.dart';
import 'package:flutterkit/pages/api_services/api_services.dart';
import 'package:flutterkit/pages/google_map/view/view.dart';
import 'package:flutterkit/pages/home/home.dart';
import 'package:flutterkit/pages/offline/offline.dart';
import 'package:flutterkit/pages/scanner/view/scanner_page.dart';


void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: Theme.of(context).copyWith(
          appBarTheme: Theme.of(context)
              .appBarTheme
              .copyWith(
              brightness: Brightness.dark
          ),
        ),
        title: 'Flutter Demo',
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''),
          Locale('es', ''),
        ],
        home: App(title: 'movies app'),
        /// Define the app routes
        initialRoute: '/',
        routes: {
          '/MapScreen': (context) =>  GoogleMapPage(),
          '/Scanner' : (context) => Scanner(),
          '/apiservices' : (context) => APIServices(),
          '/home' : (context) => Home(),
          '/moviesstored' : (context) => Offline(),
        }
    );
  }
}
