import 'package:flutter/material.dart';
import 'package:flutterkit/config/palette.dart';
import 'package:flutterkit/pages/navigation_drawer/navigation_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class Documentation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawers(),
        appBar: AppBar(
            title: Text( AppLocalizations.of(context)!.documentation),
            backgroundColor: Palette.navigationBar
        ),
        body: Container()
    );
  }
}
