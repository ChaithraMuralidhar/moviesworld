import 'package:flutter/material.dart';
import 'package:flutterkit/pages/authentication/authentication.dart';
import 'package:alan_voice/alan_voice.dart';

class App extends StatefulWidget {
  const App({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  String  _alanSdkKey = "8c6feec583babe9c3063edcff611a57d2e956eca572e1d8b807a3e2338fdd0dc/stage" ;
  @override
  void initState() {
    super.initState();
    initAlan();
  }
  initAlan(){
    AlanVoice.addButton( _alanSdkKey);
    AlanVoice.callbacks.add((command)=> _handleCommand(command.data));
  }
  void _handleCommand(Map<String, dynamic> command) {
    switch(command["command"]) {
      case "MapScreen":
        Navigator.pushNamed(context, '/MapScreen');
        break;
      case "back":
        Navigator.pop(context);
        break;
      case "scanner":
        Navigator.pushNamed(context, '/Scanner');
        break;
      case "movielist":
        Navigator.pushNamed(context, '/apiservices');
        break;
      case "home":
        Navigator.pushNamed(context, '/home');
        break;
      case "moviesstored":
        Navigator.pushNamed(context, '/moviesstored');
        break;

      default:
        debugPrint("Unknown command");
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Login();
  }

}
