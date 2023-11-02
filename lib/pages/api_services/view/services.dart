import 'package:flutter/material.dart';
import 'package:flutterkit/config/palette.dart';
import 'package:flutterkit/pages/api_services/widgets/widgets.dart';
import 'package:flutterkit/pages/navigation_drawer/navigation_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class APIServices extends StatefulWidget {
  @override
  _APIServicesState createState() => _APIServicesState();

}

class _APIServicesState extends State<APIServices> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<String> items = ["Action", "Adventure","Drama", "Family","History","Sci-Fi","Sport", "Western"];
  static List<Widget> _widgetOptions = <Widget>[
    Padding(
      padding: EdgeInsets.all(15.0),
      child: Text(
        'This section shows the  Top 250 movies as rated by regular voters , account info and other settings.',
        style: optionStyle,
      ),
    ),
    APIWidget(),
    Padding(
      padding: EdgeInsets.all(10.0),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ),
    ),
    Account(),
    Text(
      'Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawers(),
        appBar: AppBar(
            title: Text( AppLocalizations.of(context)!.apiService),
            backgroundColor: Palette.navigationBar,
            actions: <Widget>[Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: _selectedIndex == 1 ? GestureDetector(
                  onTap: () {
                  // APIWidget api = new APIWidget();
                    SnackBar(content: Text("Data Saved"),);
                   APIWidget.saveToDB();

                  },
                  child:  Icon(
                 Icons.save_alt_sharp,
                size: 26.0,
                ),

                ) : Text(""),
            )
            ],
        ),
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.api),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Genre',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black45,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
    );
  }

}
