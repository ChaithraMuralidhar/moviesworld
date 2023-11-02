import 'package:flutter/material.dart';
import 'package:flutterkit/config/palette.dart';
import 'package:flutterkit/pages/navigation_drawer/navigation_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  //  Future.delayed(Duration.zero, () => showNotification(context));
  }

  void showNotification(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Hurry!!!'),
        backgroundColor: Colors.lightBlue,
        content: const Text('Hey User, book Tickets at PVR cinemas at 50% off, use code WEWWQ'),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topRight,
      //       end: Alignment.bottomLeft,
      //       colors: [
      //         Colors.white,
      //         Colors.red,
      //       ],
      //     )
      // ),
      child: Scaffold(
       // backgroundColor:Colors.transparent ,
        drawer: NavigationDrawers(),
        appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.navigationTitleHome),
            backgroundColor: Palette.navigationBar),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: 25.0),
                // Text(
                //   "UST Product Engineering",
                //   style: TextStyle(
                //     fontSize: 30.0,
                //     color: Colors.red,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
                // SizedBox(height: 25.0),
                // const Divider(
                //   height: 5,
                //   thickness: 2,
                //   indent: 0,
                //   endIndent: 0,
                //   color: Colors.grey,
                // ),
                // Header("Welcome To Movies  World "),
                ExpansionTile(
                  title: Text(
                    "About Us",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[
                    Description(
                        "Jog your memory about a movie, show, or person on the tip of your tongue"),
                    Description(
                        "Provides info for movie content, designed to help fans explore the world of movies and shows and decide what to watch."),
                    SizedBox(height: 10),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Featured Content",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  children: <Widget>[
                    Description("Internationalizing"),
                    Description(
                        "Authentication : Common User Authentication with OAuth and Biometric Authentication"),
                    Description("Barcode and QR Code Scanning For Movies Ticket"),
                    Description(
                        "Authentication : Common User Authentication with OAuth and Biometric Authentication"),
                    Description(
                        "Google Maps Integration with some widely used common features to find nearby theatres"),
                    SizedBox(height: 10),
                  ],
                ),
                ExpansionTile(
                  title: Text(
                    "Terms & Condition",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  children: <Widget>[
                    Description(
                        " You must be at least 18 years of age  to become a member of the Movies World service."),
                    Description("You may access the Movies World content primarily within the country in which you have established your account and only in geographic locations where we offer our service and have licensed such content."),
                    Description(
                        "The Movies World service is provided  without warranty or condition"),
                    SizedBox(height: 10),
                  ],
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.stretch,
            ),
          ),
        )
    ),
    );
  }
}
