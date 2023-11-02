import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterkit/pages/ticketbooking/controller/seat_selection_controller.dart';
import 'package:flutterkit/pages/ticketbooking/components/dummy_data.dart';
import 'package:flutterkit/pages/ticketbooking/model/theatre_model.dart';
import 'package:flutterkit/pages/ticketbooking/seat_selection_screen.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controller/calender_controller.dart';

class TheatreBlock extends StatelessWidget {
  final TheatreModel model;
  final bool isBooking;
  final Function() onTimeTap;
  final bool isSelected;
  const TheatreBlock({
    Key? key,
    required this.model,
    this.isBooking = false,
    required this.onTimeTap,  this.isSelected = false,
  }) : super(key: key);

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
  @override
  Widget build(BuildContext context) {
    var instance = CalendarController.instance;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Text(
               model.name,
               style: TextStyle(
                 fontSize: 17,
                 fontWeight: FontWeight.bold
               ),
              ),
             GestureDetector(
               onTap: (){
                showModalBottomSheet(
                  isScrollControlled: true,
                    context: context,
                    backgroundColor: Colors.transparent,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height*0.5,

                    ),
                    builder: (_){
                  return Stack(
children: [
  Container(
    margin: const EdgeInsets.only(top: 50),
    height: double.maxFinite,
    width: double.maxFinite,
    color: CupertinoColors.systemGrey5,
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        Container(
          height:200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
          ),
          child:ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              markers: {
                _kGooglePlexMarker1,
                _kGooglePlexMarker2,
                _kGooglePlexMarker3
              },
              onMapCreated: (GoogleMapController controller) {
                // _controller.complete(controller);
              },
            ),
          ),

        ),
        SizedBox(
          height: 12,
        ),
        Text(model.name,style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
        ),
        SizedBox(
          height: 10,
        ),

        RichText(text: TextSpan(
          children: [
            const WidgetSpan(
                child: Icon(
                Icons.location_on,
                  size: 18,
                    color: Colors.black54
                )
            ),
            TextSpan(
              text: "  Trivandrum",style: TextStyle(
              color: Colors.black54,
              fontSize: 16
            )
            ),

          ]
        )
        ),
        SizedBox(
          height: 10,
        ),
        Text(
            model.fullAddress,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54
          ),
        )
      ],
    ),
  ),

],
                  );
                });
               },
                 child:Icon(
                   Icons.info_outline_rounded,
                   color: Colors.black12.withOpacity(0.4),
                   size: 25,
                 )
             )
           ],
         ),
          SizedBox(

          ),
          isBooking
              ? Text(
            instance.format.format(instance.selectedMovieDate.value),
            style: const TextStyle(color: Colors.black),
          ) :
          RichText(
              text: TextSpan(
            children: [
              const WidgetSpan(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.black38,
                    size: 19,

                  )
              ),
              TextSpan(
                text: '  Trivandrum ',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 15
                )
              ),
              TextSpan(
                  text: ' 9km Away',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15
                  )
              ),
            ]
          )
          ),
          const SizedBox(
            height: 10,
          ),
          Wrap(
            runSpacing: 20,
            spacing: 20,
            children: List.generate(
                4,
                    (index){
                      bool isSelected = index == SeatSelectionController.instance.timeSelectedIndex.value && isBooking;
                      Color color = index % 2 == 0 ? Colors.orange : Colors.green;
                  return GestureDetector(
                    onTap: (){
                      // onTimeTap()
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SeatSelectionScreen(
                           theatreModel: theatres[index],
                      )));
                    },
                    child:Container(
                      decoration: BoxDecoration(
                        color:  isSelected ?Colors.green:CupertinoColors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1,color:isSelected ?Colors.green: CupertinoColors.systemGrey2)
                      ),
                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                      child: Text(
                        model.timings[index],
style: TextStyle(
    color: isSelected ?Colors.white: color
),
                      ),
                    ) ,
                  );
                    } ),
          )
        ],
      ),
    );
  }
}
