
import 'package:flutter/material.dart';
import 'package:flutterkit/config/palette.dart';
import 'package:flutterkit/pages/navigation_drawer/navigation_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawers(),
        appBar: AppBar(
            title: Text( AppLocalizations.of(context)!.notification),
            backgroundColor: Palette.navigationBar
        ),
        body: Text("1 Notifications Found"));
  }
}
