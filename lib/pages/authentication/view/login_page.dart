import 'package:flutter/material.dart';
import 'package:flutterkit/pages/api_services/api_services.dart';
import 'package:flutterkit/pages/google_map/view/view.dart';
import 'package:flutterkit/pages/home/home.dart';
import 'package:flutterkit/pages/navigation_drawer/navigation_drawer.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_authentication/user_authentication.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter_siri_suggestions/flutter_siri_suggestions.dart';

import '../../../networking/model/Movie.dart';
import '../../api_services/widgets/APIWidget.dart';
import '../../api_services/widgets/DetailsWidget.dart';
import '../../scanner/view/scanner_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>  {
  String _text = 'added movieActivity, mapActivity, scannerActivity suggestions 🙋‍♂️';
  @override
  void initState() {
    super.initState();
   initSuggestions();
  }
  void initSuggestions() async {
    print("In Login screen");
    FlutterSiriSuggestions.instance.configure(
        onLaunch: (Map<String, dynamic> message) async {
          debugPrint('[FlutterSiriSuggestions] [onLaunch] $message');
          //Awaken from Siri Suggestion
          ///// TO DO : do something!
          String __text;

          debugPrint(
              "[FlutterSiriSuggestions] Called by ${message['key']} suggestion.");

          switch (message["key"]) {
            case "movieActivity":
              __text = "redirect to Movies List";
              print(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => APIServices()),
              );
              break;
            case "scannerActivity":
              __text = "redirect to Scanner";
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Scanner()),
              );
              break;

            case "mapActivity":
              __text = "redirect to Map Description";
              //  let selectedMovie = Movie(crew: '')

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GoogleMapPage()),
                // MaterialPageRoute(builder: (context) =>  DetailsWidget(selectedMovie: null,)),
              );
              break;

            default:
              __text = "hmmmm...... made a typo";
          }

          setState(() {
            _text = __text;
          });
        });

    await FlutterSiriSuggestions.instance.registerActivity(
        const FlutterSiriActivity("movieActivity Suggestion", "movieActivity",
            isEligibleForSearch: true,
            isEligibleForPrediction: true,
            contentDescription: "Open movieActivity",
            suggestedInvocationPhrase: "open movie pagep",
            userInfo: {"info": "sample"}));

    await FlutterSiriSuggestions.instance
        .registerActivity(const FlutterSiriActivity(
      "scannerActivity Suggestion",
      "scannerActivity",
      isEligibleForSearch: true,
      isEligibleForPrediction: true,
      contentDescription: "Open FLutterKit Scan Page 🍺",
      suggestedInvocationPhrase: "coooooool",
    ));

    await FlutterSiriSuggestions.instance
        .registerActivity(const FlutterSiriActivity(
      "mapActivity Suggestion",
      "mapActivity",
      isEligibleForSearch: true,
      isEligibleForPrediction: true,
      contentDescription: "Open FLutterKit Map Page 🍺",
      suggestedInvocationPhrase: "coooooool",
    ));
  }

  login(BuildContext context) {

    final userAuth = new UserAuthentication();
    if(userAuth.emailValidate(email: "test@test.com")) {
      userAuth.logInWithEmailAndPassword(email: "test@test.com", password: "test").then((user) => {
        print(user),
        userAuth.getAuthToken().then((value) => print(value)),
        navigateToHome(context),
      }
      );
    } else {
      print("Email is not valid");
    }
  }

  biometricLogin(BuildContext context) async{
    final localAuth = LocalAuthentication();
    final isAvailable = await localAuth.canCheckBiometrics;
    final isDeviceSupported = await localAuth.isDeviceSupported();
    if(isAvailable && isDeviceSupported) {
      bool didAuthenticate =
      await localAuth.authenticate(
          localizedReason: 'Please authenticate to valid user',


      );
      if(didAuthenticate) {
        navigateToHome(context);
      }
    } else {
      print("Biometric auth not available");
    }
  }

  navigateToHome(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Home()
    ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawers(),
        body:  Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background_movies.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 120, 0, 30),
                      child: Text("UST Product Engineering",
                      style: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 20
                      ),)
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: Text("Movies World",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 55
                          ),)
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'moviesworlduser@bct.com',
                            hintStyle: TextStyle(color: Colors.white),
                            fillColor: Color.fromRGBO(999, 999, 999, 0.4),
                            filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '********',
                          hintStyle: TextStyle(color: Colors.white),
                          fillColor: Color.fromRGBO(999, 999, 999, 0.4),
                          filled: true,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white70,
                          primary: Colors.black87,
                          minimumSize: Size(MediaQuery.of(context).size.width-40, 44),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2)),
                          ),
                        ),
                        onPressed: () {
                          login(context);
                        },
                        child: Text('Login'),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          biometricLogin(context);
                        },
                        icon: Icon(Icons.fingerprint,
                            color: Colors.white,
                            size: 60.0),
                    )
                  ],
                )
            ),
        ),

    );
  }
}
