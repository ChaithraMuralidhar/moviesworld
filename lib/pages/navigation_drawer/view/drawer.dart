import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterkit/config/palette.dart';
import 'package:flutterkit/pages/api_services/api_services.dart';
import 'package:flutterkit/pages/authentication/authentication.dart';
import 'package:flutterkit/pages/documentation/documentation.dart';
import 'package:flutterkit/pages/google_map/google_map.dart';
import 'package:flutterkit/pages/offline/offline.dart';
import 'package:flutterkit/pages/scanner/scanner.dart';
import '../../testingOffline/view/moviesOffline_page.dart';
import '../widgets/widgets.dart';
import 'package:flutterkit/pages/home/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutterkit/pages/notifications/view/notifications_page.dart';


enum MenuItem {
  Profile,
  Home,
  Scanner,
  GoogleMapPage,
  APIService,
 // Offline,
  TestingOffline,
  Notification,
  Documentation,
  Logout
}

class NavigationDrawers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuPadding = EdgeInsets.symmetric(horizontal: 20);
    return Drawer(
      child: Material(
       // color: Palette.navigationDrawerBackground,
        child:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.red,
                  Colors.black,
                ],
              )
          ),
          child: ListView(
          padding: menuPadding,
          children: <Widget>[
            buildMenuHeader(
               imageURL: "https://www.flaticon.com/free-icon/user_149071",
                name: "Movies World",
                email: "moviesworlduser@bct.com",
              onTap: () => selectedMenuItem(context, MenuItem.Profile)
            ),
            const SizedBox(height: 16),
            buildSearchField(),
            const SizedBox(height: 16),
            buildMenuItem(
                menuTitle: AppLocalizations.of(context)!.home,
                icon: Icons.home,
                onTap: () => selectedMenuItem(context, MenuItem.Home)
            ),
            const SizedBox(height: 16),
            buildMenuItem(
                menuTitle: AppLocalizations.of(context)!.scanner,
                icon: Icons.qr_code_scanner,
                onTap: () => selectedMenuItem(context, MenuItem.Scanner)
            ),
            const SizedBox(height: 16),
            buildMenuItem(
                menuTitle: AppLocalizations.of(context)!.googleMap,
                icon: Icons.map,
                onTap: () => selectedMenuItem(context, MenuItem.GoogleMapPage)
            ),
            const SizedBox(height: 16),
            buildMenuItem(
                menuTitle: AppLocalizations.of(context)!.apiService,
                icon: Icons.api,
                onTap: () => selectedMenuItem(context, MenuItem.APIService)
            ),
            // const SizedBox(height: 16),
            // buildMenuItem(
            //     menuTitle: AppLocalizations.of(context)!.offline,
            //     icon: Icons.signal_cellular_connected_no_internet_0_bar,
            //     onTap: () => selectedMenuItem(context, MenuItem.Offline)
            // ),
            const SizedBox(height: 16),
            buildMenuItem(
                menuTitle: AppLocalizations.of(context)!.testingOffline,
                icon: Icons.signal_cellular_connected_no_internet_0_bar,
                onTap: () => selectedMenuItem(context, MenuItem.TestingOffline)
            ),
            const SizedBox(height: 16),
            buildMenuItem(
                menuTitle: AppLocalizations.of(context)!.notification,
                icon: Icons.doorbell_rounded,
                onTap: () => selectedMenuItem(context, MenuItem.Notification)
            ),
            const SizedBox(height: 24),
            Divider(height: 1,color: Palette.navigationDrawerForeground),
            const SizedBox(height: 24),
            buildMenuItem(
                menuTitle: AppLocalizations.of(context)!.documentation,
                icon: Icons.book,
                onTap: () => selectedMenuItem(context, MenuItem.Documentation)
            ),
            const SizedBox(height: 16),
            buildMenuItem(
                menuTitle: AppLocalizations.of(context)!.logout,
                icon: Icons.logout,
                onTap: () => selectedMenuItem(context, MenuItem.Logout)
            ),
            const SizedBox(height: 16),
          ],
        ),

      ),
      ),
    );
  }

  void selectedMenuItem(BuildContext context, MenuItem menuItemValue) {
    Navigator.of(context).pop();
    switch(menuItemValue) {
      case MenuItem.Profile:
        break;
      case MenuItem.Home:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Home()
        ));
        break;
      case MenuItem.Scanner:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Scanner()
        ));
        break;
      case MenuItem.GoogleMapPage:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => GoogleMapPage()
        ));
        break;
      case MenuItem.APIService:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => APIServices()
        ));
        break;
      // case MenuItem.Offline:
      //   Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) => Offline()
      //   ));
      //   break;
      case MenuItem.TestingOffline:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MoviesOffline()
        ));
        break;
      case MenuItem.Notification:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Notifications()
        ));
        break;
      case MenuItem.Documentation:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Documentation()
        ));
        break;
      case MenuItem.Logout:
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Login()
        ));
        break;
    }
  }
}