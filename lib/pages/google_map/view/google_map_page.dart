import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutterkit/config/palette.dart';

import 'package:flutterkit/pages/navigation_drawer/navigation_drawer.dart';


import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../ticketbooking/components/list_theatres.dart';

class GoogleMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawers(),
      appBar: AppBar(
          title: Text( AppLocalizations.of(context)!.googleMap),
          backgroundColor: Palette.navigationBar
      ),
      body:SimpleDialog(
        contentPadding: EdgeInsets.all(20),
        title:const Text('SELECT YOUR LOCATION'),
        backgroundColor: Colors.grey[200],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(16.0))),
        children: <Widget>[
          SimpleDialogOption(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapSampleTrivandrum()));
            },
            child:const Text('TRIVANDRUM'),
            padding:EdgeInsets.symmetric(vertical: 20.0, horizontal: 68.0) ,
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapSampleKochi()));
            },
            child: const Text('KOCHI'),
            padding:EdgeInsets.symmetric(vertical: 20.0, horizontal: 90.0) ,
          ),

          SimpleDialogOption(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapSampleDelhi()));
            },
            child: const Text('DELHI'),
            padding:EdgeInsets.symmetric(vertical: 20.0, horizontal: 90.0) ,

          ),
        ],
      ),
    );
  }
}

class MapSampleTrivandrum extends StatefulWidget {
  @override
  State<MapSampleTrivandrum> createState() => MapSampleStateTrivandrum();
}

class MapSampleStateTrivandrum extends State<MapSampleTrivandrum> {
  Completer<GoogleMapController> _controller = Completer();



  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(3.148561, 101.652778),
    zoom: 16.4746,
  );

  static final Marker _kGooglePlexMarker1 = Marker(
    markerId: MarkerId('_KGooglePlex'),
    infoWindow: InfoWindow(title: 'Carnival Atmos'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(3.148561, 101.652778),


  );
  static final Marker _kGooglePlexMarker2 = Marker(
    markerId: MarkerId('_KGooglePlex'),
    infoWindow: InfoWindow(title: 'Aries Plex'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(3.150771, 101.654449),
  );
  static final Marker _kGooglePlexMarker3 = Marker(
    markerId: MarkerId('_KGooglePlex'),
    infoWindow: InfoWindow(title: 'Sree Kalidas'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(3.144771, 101.651449),
  );
  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: Text( AppLocalizations.of(context)!.googleMap),
          backgroundColor: Palette.navigationBar
      ),
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Stack(
          children: [


            GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              markers: {
                _kGooglePlexMarker1,
                _kGooglePlexMarker2,
                _kGooglePlexMarker3
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ListTheatres(

                  )));

                },
                child: Text('Book Tickets')
            ),

          ],

        ),


      ),
    );  }

}


// Map Sample Kochi


class MapSampleKochi extends StatefulWidget {
  @override
  State<MapSampleKochi> createState() => MapSampleStateKochi();
}

class MapSampleStateKochi extends State<MapSampleKochi> {
  Completer<GoogleMapController> _controller = Completer();



  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(9.931233,	76.267303),
    zoom: 16.4746,
  );

  static final Marker _kGooglePlexMarker1 = Marker(
    markerId: MarkerId('_KGooglePlex'),
    infoWindow: InfoWindow(title: 'Cinepolis Center Square Mall'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(9.932233, 76.267303),


  );
  static final Marker _kGooglePlexMarker2 = Marker(
    markerId: MarkerId('_KGooglePlex'),
    infoWindow: InfoWindow(title: 'PVR Cinemas'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(9.929233, 76.267303),
  );
  static final Marker _kGooglePlexMarker3 = Marker(
    markerId: MarkerId('_KGooglePlex'),
    infoWindow: InfoWindow(title: 'PVR Oberon Kochi'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(9.926233, 76.267303),
  );
  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: Text( AppLocalizations.of(context)!.googleMap),
          backgroundColor: Palette.navigationBar
      ),
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Stack(
          children: [


            GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              markers: {
                _kGooglePlexMarker1,
                _kGooglePlexMarker2,
                _kGooglePlexMarker3
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ListTheatres(

                  )));

                },
                child: Text('Book Tickets')
            ),

          ],

        ),


      ),
    );  }

}

// Map Sample Delhi


class MapSampleDelhi extends StatefulWidget {
  @override
  State<MapSampleDelhi> createState() => MapSampleStateDelhi();
}

class MapSampleStateDelhi extends State<MapSampleDelhi> {
  Completer<GoogleMapController> _controller = Completer();



  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(28.643206, 77.11578),
    zoom: 14.4746,
  );

  static final Marker _kGooglePlexMarker1 = Marker(
    markerId: MarkerId('_KGooglePlex'),
    infoWindow: InfoWindow(title: 'Carnival Atmos Delhi'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(28.650651, 77.11578),


  );
  static final Marker _kGooglePlexMarker2 = Marker(
    markerId: MarkerId('_KGooglePlex'),
    infoWindow: InfoWindow(title: 'Aries Plex Delhi'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(28.643207, 77.11578),
  );

  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: Text( AppLocalizations.of(context)!.googleMap),
          backgroundColor: Palette.navigationBar
      ),
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: Stack(
          children: [


            GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              markers: {
                _kGooglePlexMarker1,
                _kGooglePlexMarker2,
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ListTheatres(

                  )));

                },
                child: Text('Book Tickets')
            ),

          ],

        ),


      ),
    );  }

}